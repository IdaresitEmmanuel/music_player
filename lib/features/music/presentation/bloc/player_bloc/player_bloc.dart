import 'dart:async';
import 'dart:developer';

import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
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
  PlayerBloc(this._audioHandler) : super(PlayerState.initial()) {
    // Stream Subscriptions

    playbackstateSubscription =
        _audioHandler.playbackState.listen((playbackState) {
      add(PlayStateEvent(
          isPlaying: playbackState.playing,
          currentIndex: playbackState.queueIndex!));
    });

    queueSubscription = _audioHandler.queue.listen((playlist) {
      add(QueueEvent(musicList: mediaItemToMusic(playlist)));
    });

    // bloc Events
    on<LoadPlaylistEvent>((event, emit) async {
      Map<String, dynamic> items = {};
      items['newQueue'] = event.mediaItems;
      items['currentIndex'] = event.index;
      await _audioHandler.customAction(
          KeyManager.newPlaylistKey.toString(), items);
    });

    on<PlayStateEvent>((event, emit) {
      emit(state.copyWith(
          isPlaying: event.isPlaying, currentIndex: event.currentIndex));
    });

    on<QueueEvent>((event, emit) {
      emit(state.copyWith(queue: event.musicList));
    });

    // controls events
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
  }

  @override
  Future<void> close() {
    playbackstateSubscription.cancel();
    queueSubscription.cancel();
    return super.close();
  }
}