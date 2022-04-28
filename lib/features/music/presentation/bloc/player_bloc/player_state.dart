part of 'player_bloc.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required bool isPlaying,
    required List<Music> queue,
    required int currentIndex,
  }) = _PlayerState;

  factory PlayerState.initial() =>
      const PlayerState(isPlaying: false, queue: [], currentIndex: 0);
}
