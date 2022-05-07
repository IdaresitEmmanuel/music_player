import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../service_locator.dart';

Future<AudioHandler> initAudioService() async {
  return await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      preloadArtwork: false,
      androidNotificationIcon: 'mipmap/launch_image',
      androidNotificationChannelId: 'com.hye.myapp.audio',
      androidNotificationChannelName: 'Audio Service Demo',
      androidNotificationOngoing: false,
      androidStopForegroundOnPause: true,
      androidShowNotificationBadge: false,
    ),
  );
}

class MyAudioHandler extends BaseAudioHandler with QueueHandler, SeekHandler {
  final _equalizer = sl<AndroidEqualizer>();
  final _loudnessEnhancer = AndroidLoudnessEnhancer();
  late final AudioPlayer _player;
  final _playlist = ConcatenatingAudioSource(children: []);
  late final SharedPreferences _sharedPreferences = sl<SharedPreferences>();
  MyAudioHandler() {
    _init();
    _notifyAudioHandlerAboutPlaybackEvents();
    _listenForDurationChanges();
    _listenForSequenceStateChanges();
    _setShuffleMode();
    _setRepeatMode();
    // _listenForShuffleMode();
    // _listenForRepeatMode();
  }

  _setShuffleMode() async {
    var shuffleMode = _sharedPreferences.getString(Shuffle.key.toString()) ??
        Shuffle.off.toString();
    if (shuffleMode == Shuffle.on.toString()) {
      setShuffleMode(AudioServiceShuffleMode.all);
    } else {
      setShuffleMode(AudioServiceShuffleMode.none);
    }
  }

  _setRepeatMode() async {
    var repeatMode = _sharedPreferences.getString(Repeat.key.toString()) ??
        Repeat.off.toString();
    if (repeatMode == Repeat.all.toString()) {
      setRepeatMode(AudioServiceRepeatMode.all);
    } else if (repeatMode == Repeat.single.toString()) {
      setRepeatMode(AudioServiceRepeatMode.one);
    } else {
      setRepeatMode(AudioServiceRepeatMode.none);
    }
  }

  Future<void> _init() async {
    _player = AudioPlayer(
      audioPipeline: AudioPipeline(
        androidAudioEffects: [
          // _loudnessEnhancer,
          // _equalizer,
        ],
      ),
    );
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    _playlist.clear();
    try {
      await _player.setAudioSource(
        _playlist,
        initialIndex: 0,
        initialPosition: Duration.zero,
      );
    } catch (e) {
      // print("Error: $e");
    }
  }

  // callbacks fuctions
  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() async {
    await _player.stop();
    return super.stop();
  }

  @override
  Future<void> skipToNext() {
    _player.seekToNext();
    return super.skipToNext();
  }

  @override
  Future<void> skipToPrevious() {
    _player.seekToPrevious();
    return super.skipToPrevious();
  }

  @override
  Future<void> setShuffleMode(AudioServiceShuffleMode shuffleMode) {
    playbackState.add(playbackState.value.copyWith(shuffleMode: shuffleMode));
    if (shuffleMode == AudioServiceShuffleMode.all) {
      _player.setShuffleModeEnabled(true);
      _sharedPreferences.setString(
          Shuffle.key.toString(), Shuffle.on.toString());
    } else {
      _player.setShuffleModeEnabled(false);
      _sharedPreferences.setString(
          Shuffle.key.toString(), Shuffle.off.toString());
    }
    return super.setShuffleMode(shuffleMode);
  }

  @override
  Future<void> setRepeatMode(AudioServiceRepeatMode repeatMode) {
    playbackState.add(playbackState.value.copyWith(repeatMode: repeatMode));
    if (repeatMode == AudioServiceRepeatMode.all) {
      _player.setLoopMode(LoopMode.all);
      _sharedPreferences.setString(
          Repeat.key.toString(), Repeat.all.toString());
    } else if (repeatMode == AudioServiceRepeatMode.one) {
      _player.setLoopMode(LoopMode.one);
      _sharedPreferences.setString(
          Repeat.key.toString(), Repeat.single.toString());
    } else {
      _player.setLoopMode(LoopMode.off);
      _sharedPreferences.setString(
          Repeat.key.toString(), Repeat.off.toString());
    }

    return super.setRepeatMode(repeatMode);
  }

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> skipToQueueItem(int index) async {
    if (index < 0 || index >= queue.value.length) return;
    if (_player.shuffleModeEnabled) {
      index = _player.shuffleIndices![index];
    }
    _player.seek(Duration.zero, index: index);
  }

  // this function is used to reorder the playlist for the player
  // and the queue for the audio handler
  @override
  Future customAction(String name, [Map<String, dynamic>? extras]) async {
    if (name == CustomAction.reorderList.toString()) {
      final mediaItem =
          queue.value.removeAt(extras![Reorder.oldIndex.toString()]);
      queue.value.insert(extras[Reorder.newIndex.toString()], mediaItem);
      _playlist.move(extras[Reorder.oldIndex.toString()],
          extras[Reorder.newIndex.toString()]);
    }
    if (name == CustomAction.clearList.toString()) {
      stop();
    }

    if (name == CustomAction.newPlaylistKey.toString()) {
      setNewQueue(
          newQueue: extras!['newQueue'], currentIndex: extras['currentIndex']);
    }

    return super.customAction(name, extras);
  }

  Future<void> setNewQueue(
      {required List<MediaItem> newQueue, required int currentIndex}) async {
    if (_player.playing) {
      _player.stop().onError(
          (error, stackTrace) => log(stackTrace.toString(), error: error));
    }
    await _playlist.clear().onError(
        (error, stackTrace) => log(stackTrace.toString(), error: error));
    try {
      queue.value.clear();
    } catch (e) {
      log("clear queue error", error: e);
    }

    // manage Just Audio
    final audioSource = newQueue.map(_createAudioSource);
    await _playlist.addAll(audioSource.toList()).onError(
        (error, stackTrace) => log(stackTrace.toString(), error: error));

    try {
      queue.add(newQueue);
    } catch (e) {
      log("update queue error", error: e);
    }

    await _player
        .setAudioSource(_playlist,
            initialIndex: currentIndex, initialPosition: Duration.zero)
        .onError((error, stackTrace) {
      log(stackTrace.toString(), error: error);
      return Duration.zero;
    });

    _player.play().onError((error, stackTrace) {
      if (_player.hasNext) {
        _player.seekToNext().onError(
            (error, stackTrace) => log(stackTrace.toString(), error: error));
        _player.play().onError(
            (error, stackTrace) => log(stackTrace.toString(), error: error));
      } else if (_player.hasPrevious) {
        _player.seek(Duration.zero, index: 0).onError(
            (error, stackTrace) => log(stackTrace.toString(), error: error));
        _player.play().onError(
            (error, stackTrace) => log(stackTrace.toString(), error: error));
      }
    });
  }

  // @override
  // Future<void> addQueueItems(List<MediaItem> mediaItems) async {
  //   final audioSource = mediaItems.map(_createAudioSource);
  //   _playlist.addAll(audioSource.toList());
  //   // notify system
  //   final newQueue = queue.value..addAll(mediaItems);

  //   queue.add(newQueue);
  // }

  @override
  Future<void> removeQueueItemAt(int index) async {
    // manage Just Audio
    _playlist.removeAt(index);
    // notify system
    final newQueue = queue.value..removeAt(index);
    queue.add(newQueue);
  }

  UriAudioSource _createAudioSource(MediaItem mediaItem) {
    return AudioSource.uri(
      mediaItem.extras!['uri'],
      tag: mediaItem,
    );
  }

  void _notifyAudioHandlerAboutPlaybackEvents() {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
      playbackState.add(playbackState.value.copyWith(
        // controls: [
        //   MediaControl.skipToPrevious,
        //   if (playing) MediaControl.pause else MediaControl.play,
        //   MediaControl.skipToNext,
        // ],
        // systemActions: const {
        //   MediaAction.seek,
        // },
        // androidCompactActionIndices: const [1],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[_player.processingState]!,
        playing: playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ));
    });
  }

  void _listenForDurationChanges() {
    _player.durationStream.listen((duration) {
      var index = _player.currentIndex;
      final newQueue = queue.value;
      if (index == null || newQueue.isEmpty) return;
      if (_player.shuffleModeEnabled) {
        index = _player.shuffleIndices![index];
      }
      final oldMediaItem = newQueue[index];
      final newMediaItem = oldMediaItem.copyWith(duration: duration);
      newQueue[index] = newMediaItem;
      queue.add(newQueue);
      mediaItem.add(newMediaItem);
    });
  }

  void _listenForSequenceStateChanges() {
    _player.sequenceStateStream.listen((SequenceState? sequenceState) {
      final sequence = sequenceState?.effectiveSequence;
      if (sequence == null || sequence.isEmpty) return;
      final items = sequence.map((source) => source.tag as MediaItem);
      queue.add(items.toList());
    });
  }
}
