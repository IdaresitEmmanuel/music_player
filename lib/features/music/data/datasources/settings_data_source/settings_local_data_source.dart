import 'package:music_player/features/music/domain/utilities/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  /// fetches the current theme from storage
  ///
  /// Throws a [SystemException] for all error codes
  Future<ThemeSetting> getTheme();

  /// sets the new theme
  ///
  /// Throws a [SystemException] for all error codes
  Future<bool> setTheme(ThemeSetting theme);
}

class SettingsLocalDataSourceImpl extends SettingsLocalDataSource {
  SharedPreferences sharedPreferences;
  SettingsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<ThemeSetting> getTheme() async {
    final themeStr = sharedPreferences.getString(ThemeSetting.key.toString());
    if (themeStr == ThemeSetting.dark.toString()) {
      return ThemeSetting.dark;
    } else {
      return ThemeSetting.light;
    }
  }

  @override
  Future<bool> setTheme(ThemeSetting theme) async {
    return await sharedPreferences.setString(
        ThemeSetting.key.toString(), theme.toString());
  }
}
