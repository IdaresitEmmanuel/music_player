part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class GetThemeEvent extends SettingsEvent {}

class SetThemeEvent extends SettingsEvent {
  final ThemeSetting theme;
  SetThemeEvent({required this.theme});
}
