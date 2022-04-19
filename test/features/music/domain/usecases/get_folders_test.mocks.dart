// Mocks generated by Mockito 5.1.0 from annotations
// in music_player/test/features/music/domain/usecases/get_folders_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:music_player/core/error/failures.dart' as _i5;
import 'package:music_player/features/music/domain/entities/album.dart' as _i8;
import 'package:music_player/features/music/domain/entities/artist.dart' as _i7;
import 'package:music_player/features/music/domain/entities/folder.dart' as _i9;
import 'package:music_player/features/music/domain/entities/music.dart' as _i6;
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart'
    as _i3;

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

/// A class which mocks [MusicRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMusicRepository extends _i1.Mock implements _i3.MusicRepository {
  MockMusicRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Music>>> getAllMusic() =>
      (super.noSuchMethod(Invocation.method(#getAllMusic, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.Music>>>.value(
              _FakeEither_0<_i5.Failure, List<_i6.Music>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.Music>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Music>>> getMusicByArtist(
          String? artist) =>
      (super.noSuchMethod(Invocation.method(#getMusicByArtist, [artist]),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.Music>>>.value(
              _FakeEither_0<_i5.Failure, List<_i6.Music>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.Music>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Music>>> getMusicByAlbum(
          String? album) =>
      (super.noSuchMethod(Invocation.method(#getMusicByAlbum, [album]),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.Music>>>.value(
              _FakeEither_0<_i5.Failure, List<_i6.Music>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.Music>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Music>>> getMusicByFolder(
          String? folder) =>
      (super.noSuchMethod(Invocation.method(#getMusicByFolder, [folder]),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i6.Music>>>.value(
              _FakeEither_0<_i5.Failure, List<_i6.Music>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i6.Music>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.Artist>>> getArtists() =>
      (super.noSuchMethod(Invocation.method(#getArtists, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i7.Artist>>>.value(
              _FakeEither_0<_i5.Failure, List<_i7.Artist>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i7.Artist>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Album>>> getAlbums() =>
      (super.noSuchMethod(Invocation.method(#getAlbums, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i8.Album>>>.value(
              _FakeEither_0<_i5.Failure, List<_i8.Album>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i8.Album>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i9.Folder>>> getFolders() =>
      (super.noSuchMethod(Invocation.method(#getFolders, []),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i9.Folder>>>.value(
              _FakeEither_0<_i5.Failure, List<_i9.Folder>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i9.Folder>>>);
  @override
  _i4.Future<bool> requestStoragePermission() =>
      (super.noSuchMethod(Invocation.method(#requestStoragePermission, []),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
