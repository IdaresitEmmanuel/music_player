import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/repositories/settings_repository.dart';
import 'package:music_player/features/music/domain/usecases/settings_usecases/set_theme.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';

import 'set_theme_test.mocks.dart';

@GenerateMocks([SettingsRepository])
void main() {
  MockSettingsRepository mockSettingsRepository = MockSettingsRepository();
  SetTheme usecase = SetTheme(mockSettingsRepository);

  // test to set theme
  test('should return a bool after setting the new theme', () async {
    // set up
    when(mockSettingsRepository.setTheme(ThemeSetting.light))
        .thenAnswer((_) async => const Right(true));

    // act
    final result = await usecase(ThemeSetting.light);

    // verify
    expect(result, const Right(true));
    verify(mockSettingsRepository.setTheme(ThemeSetting.light));
  });

  // test when set theme fails
  test('should return a failure after attemptint to set new theme', () async {
    // set up
    when(mockSettingsRepository.setTheme(ThemeSetting.light))
        .thenAnswer((_) async => Left(SystemFailure()));

    // act
    final result = await usecase(ThemeSetting.light);

    // verify
    expect(result, Left(SystemFailure()));
    verify(mockSettingsRepository.setTheme(ThemeSetting.light));
  });
}
