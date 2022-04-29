part of 'player_bloc.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required bool isPlaying,
    required List<Music> queue,
    required int currentIndex,
    required Duration songDuration,
    required Duration currentPositioin,
    required AudioServiceShuffleMode shuffleMode,
    required AudioServiceRepeatMode repeatMode,
  }) = _PlayerState;

  factory PlayerState.initial() => const PlayerState(
        isPlaying: false,
        queue: [],
        currentIndex: 0,
        songDuration: Duration.zero,
        currentPositioin: Duration.zero,
        shuffleMode: AudioServiceShuffleMode.none,
        repeatMode: AudioServiceRepeatMode.none,
      );
}
