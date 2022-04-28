import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:music_player/features/music/data/datasources/settings_data_source/settings_local_data_source.dart';
import 'package:music_player/features/music/domain/repositories/settings_repository.dart';
import 'package:music_player/core/constants/enums.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  SettingsLocalDataSource localDataSource;
  SettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, ThemeSetting>> getTheme() async {
    try {
      return Right(await localDataSource.getTheme());
    } on SystemException {
      return Left(SystemFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setTheme(ThemeSetting theme) async {
    try {
      return Right(await localDataSource.setTheme(theme));
    } on SystemException {
      return Left(SystemFailure());
    }
  }
}
