import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_album_art.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_album.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_artist.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_folder.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/request_storage_permission.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';
import 'package:music_player/features/music/presentation/bloc/playlist_bloc/playlist_bloc.dart';

import '../playlist_bloc/playlist_bloc_test.mocks.dart';
import 'playlist_bloc_test.mocks.dart';

@GenerateMocks([
  RequestStoragePermission,
  GetMusicByArtist,
  GetMusicByAlbum,
  GetMusicByFolder,
  GetAlbumArt
])
void main() {
  MockRequestStoragePermission mockRequestStoragePermission =
      MockRequestStoragePermission();
  MockGetMusicByArtist mockGetMusicByArtist = MockGetMusicByArtist();
  MockGetMusicByAlbum mockGetMusicByAlbum = MockGetMusicByAlbum();
  MockGetMusicByFolder mockGetMusicByFolder = MockGetMusicByFolder();
  MockGetAlbumArt mockGetAlbumArt = MockGetAlbumArt();

  test('should verify the initial state', () async {
    final playlistBloc = PlaylistBloc(
        getMusicByAlbum: mockGetMusicByAlbum,
        getMusicByArtist: mockGetMusicByArtist,
        getMusicByFolder: mockGetMusicByFolder,
        requestStoragePermission: mockRequestStoragePermission,
        getAlbumArt: mockGetAlbumArt);

    expect(playlistBloc.state, PlaylistState.initial());
  });

  group(
    'tests for GetPlaylistEvent',
    () {
      const albumId = 1;
      const List<Music> musicList = [
        Music(
            id: 1,
            title: 'title',
            path: 'path',
            data: 'data',
            size: 1,
            albumId: albumId)
      ];
      final image = Uint8List(4);
      const artist = 'artist';
      const album = 'album';
      const folder = 'folder';
      blocTest('should check if permission was requested', build: (() {
        final playlistBloc = PlaylistBloc(
            getMusicByAlbum: mockGetMusicByAlbum,
            getMusicByArtist: mockGetMusicByArtist,
            getMusicByFolder: mockGetMusicByFolder,
            requestStoragePermission: mockRequestStoragePermission,
            getAlbumArt: mockGetAlbumArt);
        when(mockRequestStoragePermission()).thenAnswer((_) async => true);
        return playlistBloc;
      }), act: (PlaylistBloc playlistBloc) {
        const artist = 'artist';
        playlistBloc
            .add(GetPlaylistEvent(type: PlaylistType.artist, name: artist));
        when(mockGetMusicByArtist(artist))
            .thenAnswer((_) async => const Right([]));
      }, verify: (PlaylistBloc playlistBloc) {
        verify(mockRequestStoragePermission());
      });

      blocTest('should return a list of music by artist name',
          build: (() {
            final playlistBloc = PlaylistBloc(
                getMusicByAlbum: mockGetMusicByAlbum,
                getMusicByArtist: mockGetMusicByArtist,
                getMusicByFolder: mockGetMusicByFolder,
                requestStoragePermission: mockRequestStoragePermission,
                getAlbumArt: mockGetAlbumArt);
            when(mockRequestStoragePermission()).thenAnswer((_) async => true);
            return playlistBloc;
          }),
          act: (PlaylistBloc playlistBloc) {
            playlistBloc
                .add(GetPlaylistEvent(type: PlaylistType.artist, name: artist));
            when(mockGetMusicByArtist(artist))
                .thenAnswer((_) async => const Right(musicList));
          },
          expect: () => [
                PlaylistState.initial(),
                PlaylistState.initial().copyWith(musicList: musicList)
              ],
          verify: (PlaylistBloc playlistBloc) {
            verify(mockGetMusicByArtist(artist));
          });

      blocTest('should return a list of music by album name',
          build: (() {
            final playlistBloc = PlaylistBloc(
                getMusicByAlbum: mockGetMusicByAlbum,
                getMusicByArtist: mockGetMusicByArtist,
                getMusicByFolder: mockGetMusicByFolder,
                requestStoragePermission: mockRequestStoragePermission,
                getAlbumArt: mockGetAlbumArt);
            when(mockRequestStoragePermission()).thenAnswer((_) async => true);
            when(mockGetMusicByAlbum(album))
                .thenAnswer((_) async => const Right(musicList));
            when(mockGetAlbumArt(albumId)).thenAnswer((_) async => image);
            return playlistBloc;
          }),
          act: (PlaylistBloc playlistBloc) {
            playlistBloc
                .add(GetPlaylistEvent(type: PlaylistType.album, name: album));
          },
          expect: () => [
                PlaylistState.initial(),
                PlaylistState.initial().copyWith(musicList: musicList),
                PlaylistState.initial()
                    .copyWith(musicList: musicList, image: some(image))
              ],
          verify: (PlaylistBloc playlistBloc) {
            verify(mockGetMusicByAlbum(album));
            verify(mockGetAlbumArt(albumId));
          });

      blocTest('should return a list of music by folder name',
          build: (() {
            final playlistBloc = PlaylistBloc(
                getMusicByAlbum: mockGetMusicByAlbum,
                getMusicByArtist: mockGetMusicByArtist,
                getMusicByFolder: mockGetMusicByFolder,
                requestStoragePermission: mockRequestStoragePermission,
                getAlbumArt: mockGetAlbumArt);
            when(mockRequestStoragePermission()).thenAnswer((_) async => true);
            return playlistBloc;
          }),
          act: (PlaylistBloc playlistBloc) {
            playlistBloc
                .add(GetPlaylistEvent(type: PlaylistType.folder, name: folder));
            when(mockGetMusicByFolder(folder))
                .thenAnswer((_) async => const Right(musicList));
          },
          expect: () => [
                PlaylistState.initial(),
                PlaylistState.initial().copyWith(musicList: musicList)
              ],
          verify: (PlaylistBloc playlistBloc) {
            verify(mockGetMusicByFolder(folder));
          });
    },
  );
}
