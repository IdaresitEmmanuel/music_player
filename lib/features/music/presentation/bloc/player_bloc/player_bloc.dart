import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/domain/entities/music.dart';

part 'player_event.dart';
part 'player_state.dart';
part 'player_bloc.freezed.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final AudioHandler _audioHandler;
  late final StreamSubscription playbackstateSubscription;
  late final StreamSubscription queueSubscription;
  late final StreamSubscription<MediaItem?> mediaItemSubscription;

  @override
  Future<void> close() {
    playbackstateSubscription.cancel();
    queueSubscription.cancel();
    mediaItemSubscription.cancel();
    return super.close();
  }

  PlayerBloc(this._audioHandler) : super(PlayerState.initial()) {
    // Stream Subscriptions

    playbackstateSubscription =
        _audioHandler.playbackState.listen((playbackState) {
      var index = playbackState.queueIndex ?? 0;
      add(PlayStateEvent(
          isPlaying: playbackState.playing,
          currentIndex: index,
          shuffleMode: playbackState.shuffleMode));
    });

    queueSubscription = _audioHandler.queue.listen((playlist) {
      add(QueueEvent(musicList: mediaItemToMusic(playlist)));
    });

    mediaItemSubscription = _audioHandler.mediaItem.listen((mediaItem) async {
      if (mediaItem != null) {
        // mediaItems are not the same
        var musicArt = await getArtWork(state.queue[state.currentIndex].id);
        add(MediaItemEvent(
            songDurarion: mediaItem.duration ?? Duration.zero,
            musicArt: musicArt != null ? some(musicArt) : none()));
      }
    });

    // bloc Events

    // audio service events
    on<LoadPlaylistEvent>((event, emit) async {
      Map<String, dynamic> items = {};
      items['newQueue'] = event.mediaItems;
      items['currentIndex'] = event.index;
      await _audioHandler.customAction(
          KeyManager.newPlaylistKey.toString(), items);
    });

    on<PlayStateEvent>((event, emit) {
      emit(
        state.copyWith(
          isPlaying: event.isPlaying,
          currentIndex: event.currentIndex,
          shuffleMode: event.shuffleMode,
        ),
      );
    });

    on<QueueEvent>((event, emit) {
      emit(state.copyWith(queue: event.musicList));
    });

    on<MediaItemEvent>((event, emit) {
      emit(state.copyWith(
          songDuration: event.songDurarion, musicArt: event.musicArt));
    });

    on<PositionEvent>((event, emit) {
      emit(state.copyWith(currentPosition: event.currentPosition));
    });

    // player controls events
    on<Play>((event, emit) {
      _audioHandler.play();
    });

    on<Pause>((event, emit) {
      _audioHandler.pause();
    });

    on<Stop>((event, emit) {
      try {
        _audioHandler.stop();
      } catch (e) {
        log("_audioHandler onStop() error", error: e);
      }
      add(LoadPlaylistEvent(mediaItems: [], index: 0));
    });

    on<SkipPrevious>((event, emit) {
      _audioHandler.skipToPrevious();
    });

    on<SkipNext>((event, emit) {
      _audioHandler.skipToNext();
    });

    on<Seek>((event, emit) {
      _audioHandler.seek(event.position);
    });

    on<SetShuffleMode>((event, emit) {
      if (state.shuffleMode == AudioServiceShuffleMode.none) {
        _audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
      } else {
        _audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
      }
    });

    on<SetRepeatMode>((event, emit) {
      _audioHandler.setRepeatMode(event.repeatMode);
    });
  }
}
