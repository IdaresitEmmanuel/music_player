import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/repositories/settings_repository.dart';
import 'package:music_player/features/music/domain/usecases/settings_usecases/get_theme.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';

import 'get_theme_test.mocks.dart';

@GenerateMocks([SettingsRepository])
void main() {
  MockSettingsRepository mockSettingsRepository = MockSettingsRepository();
  GetTheme usecase = GetTheme(mockSettingsRepository);

  // test to retrieve the current theme
  test('should return the current theme', () async {
    // setup
    when(mockSettingsRepository.getTheme())
        .thenAnswer((_) async => const Right(ThemeSetting.light));

    // act
    final result = await usecase();

    // verify
    expect(result, const Right(ThemeSetting.light));
    verify(mockSettingsRepository.getTheme());
  });

  // test when retrieve the current theme fails
  test('should return a failure', () async {
    // setup
    when(mockSettingsRepository.getTheme())
        .thenAnswer((_) async => Left(SystemFailure()));

    // act
    final result = await usecase();

    // verify
    expect(result, Left(SystemFailure()));
    verify(mockSettingsRepository.getTheme());
  });
}
