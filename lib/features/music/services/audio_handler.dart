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
  late final AudioPlayer _player;
  final _playlist = ConcatenatingAudioSource(children: []);
  late final SharedPreferences _sharedPreferences = sl<SharedPreferences>();
  MyAudioHandler() {
    _init();
    _notifyAudioHandlerAboutPlaybackEvents();
    _listenForDurationChanges();
    _setShuffleMode();
    _setRepeatMode();
    _listenForShuffleMode();
    _listenForRepeatMode();
  }

  _setShuffleMode() {
    var shuffleMode = _sharedPreferences.getString(Shuffle.key.toString()) ??
        Shuffle.off.toString();
    if (shuffleMode == Shuffle.on.toString()) {
      _player.setShuffleModeEnabled(true);
    } else {
      _player.setShuffleModeEnabled(false);
    }
  }

  _setRepeatMode() {
    var repeatMode = _sharedPreferences.getString(Repeat.key.toString()) ??
        Repeat.off.toString();
    if (repeatMode == Repeat.all.toString()) {
      _player.setLoopMode(LoopMode.all);
    }
    if (repeatMode == Repeat.single.toString()) {
      _player.setLoopMode(LoopMode.one);
    } else {
      _player.setLoopMode(LoopMode.off);
    }
  }

  Future<void> _init() async {
    _player = AudioPlayer(
      audioPipeline: AudioPipeline(
        androidAudioEffects: [
          // _loudnessEnhancer,
          _equalizer,
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
  Future<void> play() async {
    await _player.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
  }

  @override
  Future<void> stop() async {
    await _player.pause();
    await _playlist.clear();
    await _player.stop();
    queue.value.clear();
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
  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  @override
  Future<void> skipToQueueItem(int index) =>
      _player.seek(Duration.zero, index: index);

  // this function is used to reorder the playlist for the player
  // and the queue for the audio handler
  @override
  Future customAction(String name, [Map<String, dynamic>? extras]) async {
    //   if (name == KeyManager.reorderList) {
    //     final queueItem = queue.value[extras![KeyManager.oldIndex]];

    //     queue.value.removeAt(extras[KeyManager.oldIndex]);
    //     queue.value.insert(extras[KeyManager.newIndex], queueItem);
    //     _playlist.move(extras[KeyManager.oldIndex], extras[KeyManager.newIndex]);
    //   }
    //   if (name == KeyManager.clearList) {
    //     _player.stop();
    //     queue.value.clear();
    //     _playlist.clear();
    //   }

    if (name == KeyManager.newPlaylistKey.toString()) {
      if (_player.playing) {
        _player.stop();
      }
      List<MediaItem> newQueue = extras!['newQueue'];
      int currentIndex = extras['currentIndex'];
      await _playlist.clear();
      queue.value.clear();

      // manage Just Audio
      final audioSource = newQueue.map(_createAudioSource);
      await _playlist.addAll(audioSource.toList());
      await updateQueue(newQueue);

      try {
        await _player.setAudioSource(_playlist,
            initialIndex: currentIndex, initialPosition: Duration.zero);
      } catch (e) {
        // do nothing here
      }
      try {
        _player.play();
      } catch (e) {
        if (_player.hasNext) {
          _player.seekToNext();
          _player.play();
        } else if (_player.hasPrevious) {
          _player.seek(Duration.zero, index: 0);
          _player.play();
        }
      }
    }

    return super.customAction(name, extras);
  }

  // @override
  // Future<void> updateQueue(List<MediaItem> newQueue) async {
  //   return super.updateQueue(newQueue);
  // }

  @override
  Future<void> addQueueItems(List<MediaItem> mediaItems) async {
    final audioSource = mediaItems.map(_createAudioSource);
    _playlist.addAll(audioSource.toList());
    // notify system
    final newQueue = queue.value..addAll(mediaItems);

    queue.add(newQueue);
  }

  @override
  Future<void> removeQueueItem(MediaItem mediaItem) {
    int index = queue.value.indexOf(mediaItem);
    _playlist.removeAt(index);
    return super.removeQueueItem(mediaItem);
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
        captioningEnabled: true,
      ));
    });
  }

  void _listenForDurationChanges() {
    _player.durationStream.listen((duration) {
      final index = _player.currentIndex;
      final newQueue = queue.value;
      if (index == null || newQueue.isEmpty) return;
      final oldMediaItem = newQueue[index];
      final newMediaItem = oldMediaItem.copyWith(duration: duration);
      newQueue[index] = newMediaItem;
      queue.add(newQueue);
      mediaItem.add(newMediaItem);
    });
  }

  void _listenForShuffleMode() {
    _player.shuffleModeEnabledStream.listen((event) {
      if (event) {
        playbackState.add(playbackState.value
            .copyWith(shuffleMode: AudioServiceShuffleMode.all));
      } else {
        playbackState.add(playbackState.value
            .copyWith(shuffleMode: AudioServiceShuffleMode.none));
      }
    });
  }

  void _listenForRepeatMode() {
    _player.loopModeStream.listen((event) {
      if (event == LoopMode.all) {
        playbackState.add(playbackState.value
            .copyWith(repeatMode: AudioServiceRepeatMode.all));
      } else if (event == LoopMode.one) {
        playbackState.add(playbackState.value
            .copyWith(repeatMode: AudioServiceRepeatMode.one));
      } else {
        playbackState.add(playbackState.value
            .copyWith(repeatMode: AudioServiceRepeatMode.none));
      }
    });
  }
}
