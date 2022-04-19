part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({required ThemeSetting theme}) = _SettingsState;
  factory SettingsState.initial() =>
      const SettingsState(theme: ThemeSetting.light);
}
