part of 'player_bloc.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required bool isPlaying,
    required List<Music> queue,
    required int currentIndex,
    required Duration songDuration,
    required Duration currentPosition,
    required Duration bufferedPosition,
    required AudioServiceShuffleMode shuffleMode,
    required AudioServiceRepeatMode repeatMode,
    required Option<Uint8List> musicArt,
  }) = _PlayerState;

  factory PlayerState.initial() => PlayerState(
        isPlaying: false,
        queue: [],
        currentIndex: 0,
        songDuration: Duration.zero,
        currentPosition: Duration.zero,
        bufferedPosition: Duration.zero,
        shuffleMode: AudioServiceShuffleMode.none,
        repeatMode: AudioServiceRepeatMode.none,
        musicArt: none(),
      );
}
