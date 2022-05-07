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
      var id = state.queue.isNotEmpty ? state.queue[index].id : 0;
      add(PlayStateEvent(
          isPlaying: playbackState.playing,
          currentIndex: index,
          currentId: id,
          shuffleMode: playbackState.shuffleMode,
          repeatMode: playbackState.repeatMode));
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
          CustomAction.newPlaylistKey.toString(), items);
    });

    on<PlayStateEvent>((event, emit) {
      emit(
        state.copyWith(
          isPlaying: event.isPlaying,
          currentIndex: event.currentIndex,
          currentMusicId: event.currentId,
          shuffleMode: event.shuffleMode,
          repeatMode: event.repeatMode,
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

    on<SkipToQueueItem>((event, emit) {
      if (event.index != state.currentIndex) {
        _audioHandler.skipToQueueItem(event.index);
      }
    });

    on<Seek>((event, emit) {
      _audioHandler.seek(event.position);
    });

    on<SetShuffleMode>((event, emit) async {
      if (state.shuffleMode == AudioServiceShuffleMode.none) {
        await _audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
      } else {
        await _audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
      }
    });

    on<SetRepeatMode>((event, emit) {
      switch (state.repeatMode) {
        case AudioServiceRepeatMode.none:
          {
            _audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
          }
          break;
        case AudioServiceRepeatMode.group:
        case AudioServiceRepeatMode.all:
          {
            _audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
          }
          break;

        case AudioServiceRepeatMode.one:
          {
            _audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
          }
          break;
      } // end switch
    });

    on<ReorderQueue>((event, emit) {
      final nIndex =
          event.newIndex > event.oldIndex ? event.newIndex - 1 : event.newIndex;
      Map<String, dynamic> item = {};
      item[Reorder.oldIndex.toString()] = event.oldIndex;
      item[Reorder.newIndex.toString()] = nIndex;

      _audioHandler.customAction(CustomAction.reorderList.toString(), item);
    });

    on<RemoveQueueItem>((event, emit) {
      _audioHandler.removeQueueItemAt(event.index);
    });

    on<ClearQueue>((event, emit) {
      // _audioHandler.customAction(CustomAction.clearList.toString());
      emit(PlayerState.initial());
      _audioHandler.stop();
    });
  }
}
