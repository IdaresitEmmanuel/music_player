// Mocks generated by Mockito 5.1.0 from annotations
// in music_player/test/features/music/domain/usecases/settings_usecases/get_theme_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:music_player/core/error/failures.dart' as _i5;
import 'package:music_player/features/music/domain/repositories/settings_repository.dart'
    as _i3;
import 'package:music_player/features/music/domain/utilities/enums.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [SettingsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSettingsRepository extends _i1.Mock
    implements _i3.SettingsRepository {
  MockSettingsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.ThemeSetting>> getTheme() =>
      (super.noSuchMethod(Invocation.method(#getTheme, []),
          returnValue: Future<_i2.Either<_i5.Failure, _i6.ThemeSetting>>.value(
              _FakeEither_0<_i5.Failure, _i6.ThemeSetting>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.ThemeSetting>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> setTheme(_i6.ThemeSetting? theme) =>
      (super.noSuchMethod(Invocation.method(#setTheme, [theme]),
              returnValue: Future<_i2.Either<_i5.Failure, bool>>.value(
                  _FakeEither_0<_i5.Failure, bool>()))
          as _i4.Future<_i2.Either<_i5.Failure, bool>>);
}
