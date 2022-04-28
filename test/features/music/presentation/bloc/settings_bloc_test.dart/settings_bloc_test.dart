import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/usecases/settings_usecases/get_theme.dart';
import 'package:music_player/features/music/domain/usecases/settings_usecases/set_theme.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/features/music/presentation/bloc/settings_bloc/settings_bloc.dart';

import 'settings_bloc_test.mocks.dart';

@GenerateMocks([GetTheme, SetTheme])
void main() {
  MockGetTheme mockGetTheme = MockGetTheme();
  MockSetTheme mockSetTheme = MockSetTheme();

  test('test for the initial state', () async {
    final settingsBloc =
        SettingsBloc(getTheme: mockGetTheme, setTheme: mockSetTheme);

    expect(settingsBloc.state, SettingsState.initial());
  });

  group('tests for getThemeEvent', () {
    blocTest('test',
        build: () {
          when(mockGetTheme())
              .thenAnswer((_) async => const Right(ThemeSetting.light));
          return SettingsBloc(getTheme: mockGetTheme, setTheme: mockSetTheme);
        },
        act: (SettingsBloc settingsBloc) {
          settingsBloc.add(GetThemeEvent());
        },
        expect: () =>
            [SettingsState.initial().copyWith(theme: ThemeSetting.light)]);
  });

  blocTest('test for setThemeEvent', build: () {
    when(mockSetTheme(ThemeSetting.light))
        .thenAnswer((_) async => const Right(true));
    return SettingsBloc(getTheme: mockGetTheme, setTheme: mockSetTheme);
  }, act: (SettingsBloc settingsBloc) {
    settingsBloc.setTheme(ThemeSetting.light);
  }, verify: (SettingsBloc settingsBloc) {
    verify(mockSetTheme(ThemeSetting.light));
  });
}
