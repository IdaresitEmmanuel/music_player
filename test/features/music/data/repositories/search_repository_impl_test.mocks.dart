// Mocks generated by Mockito 5.1.0 from annotations
// in music_player/test/features/music/data/repositories/search_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:music_player/features/music/data/datasources/search_data_source/search_data_source.dart'
    as _i2;
import 'package:music_player/features/music/domain/utilities/enums.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [SearchDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchDataSource extends _i1.Mock implements _i2.SearchDataSource {
  MockSearchDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.SearchCategory> getSearchCategory() => (super.noSuchMethod(
          Invocation.method(#getSearchCategory, []),
          returnValue: Future<_i4.SearchCategory>.value(_i4.SearchCategory.key))
      as _i3.Future<_i4.SearchCategory>);
  @override
  _i3.Future<bool> setSearchCategory(_i4.SearchCategory? searchCategory) =>
      (super.noSuchMethod(
          Invocation.method(#setSearchCategory, [searchCategory]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
}
