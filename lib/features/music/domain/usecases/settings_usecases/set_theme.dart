import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/repositories/settings_repository.dart';
import 'package:music_player/core/constants/enums.dart';

class SetTheme {
  SettingsRepository repo;
  SetTheme(this.repo);

  Future<Either<Failure, bool>> call(ThemeSetting theme) {
    return repo.setTheme(theme);
  }
}
