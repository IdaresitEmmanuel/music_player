// Mocks generated by Mockito 5.1.0 from annotations
// in music_player/test/features/music/presentation/bloc/search_bloc/search_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i10;

import 'package:dartz/dartz.dart' as _i9;
import 'package:flutter_bloc/flutter_bloc.dart' as _i11;
import 'package:mockito/mockito.dart' as _i1;
import 'package:music_player/core/constants/enums.dart' as _i13;
import 'package:music_player/core/error/failures.dart' as _i15;
import 'package:music_player/features/music/domain/repositories/search_repository.dart'
    as _i8;
import 'package:music_player/features/music/domain/usecases/music_usecases/get_albums.dart'
    as _i4;
import 'package:music_player/features/music/domain/usecases/music_usecases/get_all_music.dart'
    as _i2;
import 'package:music_player/features/music/domain/usecases/music_usecases/get_artists.dart'
    as _i3;
import 'package:music_player/features/music/domain/usecases/music_usecases/get_folders.dart'
    as _i5;
import 'package:music_player/features/music/domain/usecases/music_usecases/request_storage_permission.dart'
    as _i6;
import 'package:music_player/features/music/domain/usecases/search_usecases/get_search_category.dart'
    as _i12;
import 'package:music_player/features/music/domain/usecases/search_usecases/set_search_category.dart'
    as _i14;
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetAllMusic_0 extends _i1.Fake implements _i2.GetAllMusic {}

class _FakeGetArtists_1 extends _i1.Fake implements _i3.GetArtists {}

class _FakeGetAlbums_2 extends _i1.Fake implements _i4.GetAlbums {}

class _FakeGetFolders_3 extends _i1.Fake implements _i5.GetFolders {}

class _FakeRequestStoragePermission_4 extends _i1.Fake
    implements _i6.RequestStoragePermission {}

class _FakeMusicState_5 extends _i1.Fake implements _i7.MusicState {}

class _FakeSearchRepository_6 extends _i1.Fake implements _i8.SearchRepository {
}

class _FakeEither_7<L, R> extends _i1.Fake implements _i9.Either<L, R> {}

/// A class which mocks [MusicBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockMusicBloc extends _i1.Mock implements _i7.MusicBloc {
  MockMusicBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetAllMusic get getAllMusic =>
      (super.noSuchMethod(Invocation.getter(#getAllMusic),
          returnValue: _FakeGetAllMusic_0()) as _i2.GetAllMusic);
  @override
  _i3.GetArtists get getArtist =>
      (super.noSuchMethod(Invocation.getter(#getArtist),
          returnValue: _FakeGetArtists_1()) as _i3.GetArtists);
  @override
  _i4.GetAlbums get getAlbums =>
      (super.noSuchMethod(Invocation.getter(#getAlbums),
          returnValue: _FakeGetAlbums_2()) as _i4.GetAlbums);
  @override
  _i5.GetFolders get getFolder =>
      (super.noSuchMethod(Invocation.getter(#getFolder),
          returnValue: _FakeGetFolders_3()) as _i5.GetFolders);
  @override
  _i6.RequestStoragePermission get requestStoragePermission =>
      (super.noSuchMethod(Invocation.getter(#requestStoragePermission),
              returnValue: _FakeRequestStoragePermission_4())
          as _i6.RequestStoragePermission);
  @override
  _i7.MusicState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _FakeMusicState_5()) as _i7.MusicState);
  @override
  _i10.Stream<_i7.MusicState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i7.MusicState>.empty())
          as _i10.Stream<_i7.MusicState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i7.MusicEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i7.MusicEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i7.MusicState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i7.MusicEvent>(
          _i11.EventHandler<E, _i7.MusicState>? handler,
          {_i11.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i11.Transition<_i7.MusicEvent, _i7.MusicState>? transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i10.Future<void> close() => (super.noSuchMethod(
      Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i10.Future<void>);
  @override
  void onChange(_i11.Change<_i7.MusicState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}

/// A class which mocks [GetSearchCategory].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSearchCategory extends _i1.Mock implements _i12.GetSearchCategory {
  MockGetSearchCategory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.SearchRepository get searchRepository =>
      (super.noSuchMethod(Invocation.getter(#searchRepository),
          returnValue: _FakeSearchRepository_6()) as _i8.SearchRepository);
  @override
  set searchRepository(_i8.SearchRepository? _searchRepository) => super
      .noSuchMethod(Invocation.setter(#searchRepository, _searchRepository),
          returnValueForMissingStub: null);
  @override
  _i10.Future<_i13.SearchCategory> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue:
                  Future<_i13.SearchCategory>.value(_i13.SearchCategory.key))
          as _i10.Future<_i13.SearchCategory>);
}

/// A class which mocks [SetSearchCategory].
///
/// See the documentation for Mockito's code generation for more information.
class MockSetSearchCategory extends _i1.Mock implements _i14.SetSearchCategory {
  MockSetSearchCategory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.SearchRepository get searchRepository =>
      (super.noSuchMethod(Invocation.getter(#searchRepository),
          returnValue: _FakeSearchRepository_6()) as _i8.SearchRepository);
  @override
  set searchRepository(_i8.SearchRepository? _searchRepository) => super
      .noSuchMethod(Invocation.setter(#searchRepository, _searchRepository),
          returnValueForMissingStub: null);
  @override
  _i10.Future<_i9.Either<_i15.Failure, _i9.Unit>> call(
          _i13.SearchCategory? searchCategory) =>
      (super.noSuchMethod(Invocation.method(#call, [searchCategory]),
              returnValue: Future<_i9.Either<_i15.Failure, _i9.Unit>>.value(
                  _FakeEither_7<_i15.Failure, _i9.Unit>()))
          as _i10.Future<_i9.Either<_i15.Failure, _i9.Unit>>);
}
