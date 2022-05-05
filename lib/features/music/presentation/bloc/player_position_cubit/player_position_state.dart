part of 'player_position_cubit.dart';

@freezed
class PlayerPositionState with _$PlayerPositionState {
  const factory PlayerPositionState({required Duration position}) =
      _PlayerPositionState;
  factory PlayerPositionState.initial() =>
      const PlayerPositionState(position: Duration.zero);
}
