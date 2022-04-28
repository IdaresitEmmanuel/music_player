import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/core/constants/enums.dart';

abstract class SettingsRepository {
  // Theme settings
  Future<Either<Failure, ThemeSetting>> getTheme();
  Future<Either<Failure, bool>> setTheme(ThemeSetting theme);
}
