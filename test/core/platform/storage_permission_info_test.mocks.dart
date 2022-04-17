// Mocks generated by Mockito 5.1.0 from annotations
// in music_player/test/core/platform/storage_permission_info_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:typed_data' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:on_audio_query/on_audio_query.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDeviceModel_0 extends _i1.Fake implements _i2.DeviceModel {}

/// A class which mocks [OnAudioQuery].
///
/// See the documentation for Mockito's code generation for more information.
class MockOnAudioQuery extends _i1.Mock implements _i2.OnAudioQuery {
  MockOnAudioQuery() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i2.SongModel>> querySongs(
          {_i2.SongSortType? sortType,
          _i2.OrderType? orderType,
          _i2.UriType? uriType}) =>
      (super.noSuchMethod(
              Invocation.method(#querySongs, [], {
                #sortType: sortType,
                #orderType: orderType,
                #uriType: uriType
              }),
              returnValue: Future<List<_i2.SongModel>>.value(<_i2.SongModel>[]))
          as _i3.Future<List<_i2.SongModel>>);
  @override
  _i3.Future<List<_i2.SongModel>> queryAudios(
          [_i2.SongSortType? sortType,
          _i2.OrderType? orderType,
          _i2.UriType? uriType,
          String? path]) =>
      (super.noSuchMethod(
          Invocation.method(#queryAudios, [sortType, orderType, uriType, path]),
          returnValue:
              Future<List<_i2.SongModel>>.value(<_i2.SongModel>[])) as _i3
          .Future<List<_i2.SongModel>>);
  @override
  _i3.Future<List<_i2.AlbumModel>> queryAlbums(
          {_i2.AlbumSortType? sortType,
          _i2.OrderType? orderType,
          _i2.UriType? uriType}) =>
      (super.noSuchMethod(
              Invocation.method(#queryAlbums, [], {
                #sortType: sortType,
                #orderType: orderType,
                #uriType: uriType
              }),
              returnValue:
                  Future<List<_i2.AlbumModel>>.value(<_i2.AlbumModel>[]))
          as _i3.Future<List<_i2.AlbumModel>>);
  @override
  _i3.Future<List<_i2.ArtistModel>> queryArtists(
          {_i2.ArtistSortType? sortType,
          _i2.OrderType? orderType,
          _i2.UriType? uriType}) =>
      (super.noSuchMethod(
              Invocation.method(#queryArtists, [], {
                #sortType: sortType,
                #orderType: orderType,
                #uriType: uriType
              }),
              returnValue:
                  Future<List<_i2.ArtistModel>>.value(<_i2.ArtistModel>[]))
          as _i3.Future<List<_i2.ArtistModel>>);
  @override
  _i3.Future<List<_i2.PlaylistModel>> queryPlaylists(
          {_i2.PlaylistSortType? sortType,
          _i2.OrderType? orderType,
          _i2.UriType? uriType}) =>
      (super.noSuchMethod(
              Invocation.method(#queryPlaylists, [], {
                #sortType: sortType,
                #orderType: orderType,
                #uriType: uriType
              }),
              returnValue:
                  Future<List<_i2.PlaylistModel>>.value(<_i2.PlaylistModel>[]))
          as _i3.Future<List<_i2.PlaylistModel>>);
  @override
  _i3.Future<List<_i2.GenreModel>> queryGenres(
          {_i2.GenreSortType? sortType,
          _i2.OrderType? orderType,
          _i2.UriType? uriType}) =>
      (super.noSuchMethod(
              Invocation.method(#queryGenres, [], {
                #sortType: sortType,
                #orderType: orderType,
                #uriType: uriType
              }),
              returnValue:
                  Future<List<_i2.GenreModel>>.value(<_i2.GenreModel>[]))
          as _i3.Future<List<_i2.GenreModel>>);
  @override
  _i3.Future<List<_i2.SongModel>> queryAudiosFrom(
          _i2.AudiosFromType? type, Object? where) =>
      (super.noSuchMethod(Invocation.method(#queryAudiosFrom, [type, where]),
              returnValue: Future<List<_i2.SongModel>>.value(<_i2.SongModel>[]))
          as _i3.Future<List<_i2.SongModel>>);
  @override
  _i3.Future<List<_i2.SongModel>> queryAudiosOnly(_i2.AudiosOnlyType? isOnly,
          {_i2.SongSortType? sortType, _i2.OrderType? orderType}) =>
      (super.noSuchMethod(
              Invocation.method(#queryAudiosOnly, [isOnly],
                  {#sortType: sortType, #orderType: orderType}),
              returnValue: Future<List<_i2.SongModel>>.value(<_i2.SongModel>[]))
          as _i3.Future<List<_i2.SongModel>>);
  @override
  _i3.Future<List<_i2.SongModel>> querySongsBy(
          _i2.SongsByType? songsByType, List<Object>? values,
          {_i2.UriType? uriType}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #querySongsBy, [songsByType, values], {#uriType: uriType}),
              returnValue: Future<List<_i2.SongModel>>.value(<_i2.SongModel>[]))
          as _i3.Future<List<_i2.SongModel>>);
  @override
  _i3.Future<List<dynamic>> queryWithFilters(
          String? argsVal, _i2.WithFiltersType? withType, dynamic args) =>
      (super.noSuchMethod(
              Invocation.method(#queryWithFilters, [argsVal, withType, args]),
              returnValue: Future<List<dynamic>>.value(<dynamic>[]))
          as _i3.Future<List<dynamic>>);
  @override
  _i3.Future<_i4.Uint8List?> queryArtwork(int? id, _i2.ArtworkType? type,
          {_i2.ArtworkFormat? format, int? size}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #queryArtwork, [id, type], {#format: format, #size: size}),
              returnValue: Future<_i4.Uint8List?>.value())
          as _i3.Future<_i4.Uint8List?>);
  @override
  _i3.Future<_i4.Uint8List?> queryArtworks(int? id, _i2.ArtworkType? type,
          {_i2.ArtworkFormat? format, int? size}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #queryArtworks, [id, type], {#format: format, #size: size}),
              returnValue: Future<_i4.Uint8List?>.value())
          as _i3.Future<_i4.Uint8List?>);
  @override
  _i3.Future<List<_i2.SongModel>> queryFromFolder(String? path,
          {_i2.SongSortType? sortType,
          _i2.OrderType? orderType,
          _i2.UriType? uriType}) =>
      (super.noSuchMethod(
              Invocation.method(#queryFromFolder, [
                path
              ], {
                #sortType: sortType,
                #orderType: orderType,
                #uriType: uriType
              }),
              returnValue: Future<List<_i2.SongModel>>.value(<_i2.SongModel>[]))
          as _i3.Future<List<_i2.SongModel>>);
  @override
  _i3.Future<List<String>> queryAllPath() =>
      (super.noSuchMethod(Invocation.method(#queryAllPath, []),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i3.Future<List<String>>);
  @override
  _i3.Future<bool> createPlaylist(String? name,
          {String? author, String? desc}) =>
      (super.noSuchMethod(
          Invocation.method(
              #createPlaylist, [name], {#author: author, #desc: desc}),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> removePlaylist(int? playlistId) =>
      (super.noSuchMethod(Invocation.method(#removePlaylist, [playlistId]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> addToPlaylist(int? playlistId, int? audioId) => (super
      .noSuchMethod(Invocation.method(#addToPlaylist, [playlistId, audioId]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> removeFromPlaylist(int? playlistId, int? audioId) =>
      (super.noSuchMethod(
          Invocation.method(#removeFromPlaylist, [playlistId, audioId]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> moveItemTo(int? playlistId, int? from, int? to) => (super
      .noSuchMethod(Invocation.method(#moveItemTo, [playlistId, from, to]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> renamePlaylist(int? playlistId, String? newName) => (super
      .noSuchMethod(Invocation.method(#renamePlaylist, [playlistId, newName]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> permissionsStatus() =>
      (super.noSuchMethod(Invocation.method(#permissionsStatus, []),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<bool> permissionsRequest() =>
      (super.noSuchMethod(Invocation.method(#permissionsRequest, []),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<_i2.DeviceModel> queryDeviceInfo() =>
      (super.noSuchMethod(Invocation.method(#queryDeviceInfo, []),
              returnValue: Future<_i2.DeviceModel>.value(_FakeDeviceModel_0()))
          as _i3.Future<_i2.DeviceModel>);
}
