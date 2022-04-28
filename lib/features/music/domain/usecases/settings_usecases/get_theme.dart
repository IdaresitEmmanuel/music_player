import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/repositories/settings_repository.dart';
import 'package:music_player/core/constants/enums.dart';

class GetTheme {
  SettingsRepository repo;
  GetTheme(this.repo);

  Future<Either<Failure, ThemeSetting>> call() {
    return repo.getTheme();
  }
}
