import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/data/datasources/settings_data_source/settings_local_data_source.dart';
import 'package:music_player/features/music/data/repositories/settings_repository_impl.dart';
import 'package:music_player/core/constants/enums.dart';

import 'settings_repository_impl_test.mocks.dart';

@GenerateMocks([SettingsLocalDataSource])
void main() {
  MockSettingsLocalDataSource localDataSource = MockSettingsLocalDataSource();
  SettingsRepositoryImpl repositoryImpl =
      SettingsRepositoryImpl(localDataSource: localDataSource);

  group('get theme tests', () {
    test('when get theme is succesful', () async {
      when(localDataSource.getTheme())
          .thenAnswer((_) async => ThemeSetting.light);

      final result = await repositoryImpl.getTheme();

      expect(result, const Right(ThemeSetting.light));
      verify(localDataSource.getTheme());
    });

    test('when get theme is unsuccessful', () async {
      when(localDataSource.getTheme()).thenThrow(SystemException());

      final result = await repositoryImpl.getTheme();

      expect(result, Left(SystemFailure()));
      verify(localDataSource.getTheme());
    });
  });

  group('set theme tests', () {
    test('when set theme is successful', () async {
      when(localDataSource.setTheme(ThemeSetting.light))
          .thenAnswer((_) async => true);

      final result = await repositoryImpl.setTheme(ThemeSetting.light);

      expect(result, const Right(true));
      verify(localDataSource.setTheme(ThemeSetting.light));
    });

    test('when set theme is unsuccessful', () async {
      when(localDataSource.setTheme(ThemeSetting.light))
          .thenThrow(SystemException());

      final result = await repositoryImpl.setTheme(ThemeSetting.light);

      expect(result, Left(SystemFailure()));
      verify(localDataSource.setTheme(ThemeSetting.light));
    });
  });
}
