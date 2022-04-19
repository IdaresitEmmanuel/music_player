import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:music_player/features/music/data/datasources/settings_data_source/settings_local_data_source.dart';

import 'settings_local_data_source_impl_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  SettingsLocalDataSourceImpl settingsLocalDataSourceImpl =
      SettingsLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);

  // test to get theme from preferences
  test('get theme from preferences', () async {
    when(mockSharedPreferences.getString(ThemeSetting.key.toString()))
        .thenAnswer((_) => ThemeSetting.light.toString());

    final result = await settingsLocalDataSourceImpl.getTheme();

    expect(result, ThemeSetting.light);
  });

  // test to set theme to preferences
  test('set theme to preferences with error', () async {
    when(mockSharedPreferences.setString(
            ThemeSetting.key.toString(), ThemeSetting.light.toString()))
        .thenAnswer((_) async => true);

    final result =
        await settingsLocalDataSourceImpl.setTheme(ThemeSetting.light);

    expect(result, true);
    verify(mockSharedPreferences.setString(
        ThemeSetting.key.toString(), ThemeSetting.light.toString()));
  });
}
