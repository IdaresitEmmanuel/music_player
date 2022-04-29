part of 'equalizer_bloc.dart';

@freezed
abstract class EqualizerState with _$EqualizerState {
  const factory EqualizerState({required bool isEqualizerEnabled}) =
      _EqualizerState;

  factory EqualizerState.initial() =>
      const EqualizerState(isEqualizerEnabled: false);
}
