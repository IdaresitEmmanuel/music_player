import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/usecases/get_albums.dart';
import 'package:music_player/features/music/domain/usecases/get_all_music.dart';
import 'package:music_player/features/music/domain/usecases/get_artists.dart';
import 'package:music_player/features/music/domain/usecases/get_folders.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc.dart';

import 'music_bloc_test.mocks.dart';

@GenerateMocks([GetAllMusic, GetArtists, GetAlbums, GetFolders])
void main() {
  MockGetAllMusic getAllMusic = MockGetAllMusic();
  MockGetArtists getArtist = MockGetArtists();
  MockGetAlbums getAlbums = MockGetAlbums();
  MockGetFolders getFolder = MockGetFolders();

  test('musicBloc first state should be the initial state', () async {
    MusicBloc musicBloc = MusicBloc(
        getAllMusic: getAllMusic,
        getArtist: getArtist,
        getAlbums: getAlbums,
        getFolder: getFolder);
    expect(musicBloc.state, MusicState.initial());
  });

  // tests for getAllMusicEvent
  group('getAllMusicEvent test', () {
    MockGetAllMusic getAllMusic = MockGetAllMusic();
    MockGetArtists getArtist = MockGetArtists();
    MockGetAlbums getAlbums = MockGetAlbums();
    MockGetFolders getFolder = MockGetFolders();
    const List<Music> musicList = [
      Music(title: '', artist: '', album: '', path: '')
    ];
    blocTest(
        'should emit a true loading state, list of music and false loading state',
        build: () {
          MusicBloc musicBloc = MusicBloc(
              getAllMusic: getAllMusic,
              getArtist: getArtist,
              getAlbums: getAlbums,
              getFolder: getFolder);

          when(getAllMusic()).thenAnswer((_) async => const Right(musicList));
          return musicBloc;
        },
        act: (MusicBloc musicBloc) {
          musicBloc.add(GetMusicEvent());
        },
        expect: () => [
              MusicState.initial().copyWith(isMusicLoading: true),
              MusicState.initial().copyWith(
                  isMusicLoading: false,
                  musicFailureOrSuccess: some(
                    const Right(musicList),
                  ))
            ],
        verify: (MusicBloc musicBloc) {
          verify(getAllMusic());
        });

    blocTest(
        'should emit a true loading state, a failure and false loading state',
        build: () {
          MusicBloc musicBloc = MusicBloc(
              getAllMusic: getAllMusic,
              getArtist: getArtist,
              getAlbums: getAlbums,
              getFolder: getFolder);

          when(getAllMusic()).thenAnswer((_) async => Left(SystemFailure()));
          return musicBloc;
        },
        act: (MusicBloc musicBloc) {
          musicBloc.add(GetMusicEvent());
        },
        expect: () => [
              MusicState.initial().copyWith(isMusicLoading: true),
              MusicState.initial().copyWith(
                  isMusicLoading: false,
                  musicFailureOrSuccess: some(
                    Left(SystemFailure()),
                  ))
            ],
        verify: (MusicBloc musicBloc) {
          verify(getAllMusic());
        });
  });

  // test for getArtistEvent
  group('getArtistEvent test', () {
    MockGetAllMusic getAllMusic = MockGetAllMusic();
    MockGetArtists getArtist = MockGetArtists();
    MockGetAlbums getAlbums = MockGetAlbums();
    MockGetFolders getFolder = MockGetFolders();
    const List<Artist> artistList = [Artist(name: '', noOfSongs: 1)];
    blocTest(
        'should emit a true loading state, list of artist and false loading state',
        build: () {
          MusicBloc musicBloc = MusicBloc(
              getAllMusic: getAllMusic,
              getArtist: getArtist,
              getAlbums: getAlbums,
              getFolder: getFolder);

          when(getArtist()).thenAnswer((_) async => const Right(artistList));
          return musicBloc;
        },
        act: (MusicBloc musicBloc) {
          musicBloc.add(GetArtistEvent());
        },
        expect: () => [
              MusicState.initial().copyWith(isArtistLoading: true),
              MusicState.initial().copyWith(
                  isArtistLoading: false,
                  artistFailureOrSuccess: some(
                    const Right(artistList),
                  ))
            ],
        verify: (MusicBloc musicBloc) {
          verify(getArtist());
        });

    blocTest(
        'should emit a true loading state, a failure and false loading state',
        build: () {
          MusicBloc musicBloc = MusicBloc(
              getAllMusic: getAllMusic,
              getArtist: getArtist,
              getAlbums: getAlbums,
              getFolder: getFolder);

          when(getArtist()).thenAnswer((_) async => Left(SystemFailure()));
          return musicBloc;
        },
        act: (MusicBloc musicBloc) {
          musicBloc.add(GetArtistEvent());
        },
        expect: () => [
              MusicState.initial().copyWith(isArtistLoading: true),
              MusicState.initial().copyWith(
                  isArtistLoading: false,
                  artistFailureOrSuccess: some(
                    Left(SystemFailure()),
                  ))
            ],
        verify: (MusicBloc musicBloc) {
          verify(getArtist());
        });
  });

  // test for getAlbumEvent
  group('getAlbumEvent test', () {
    MockGetAllMusic getAllMusic = MockGetAllMusic();
    MockGetArtists getArtist = MockGetArtists();
    MockGetAlbums getAlbums = MockGetAlbums();
    MockGetFolders getFolder = MockGetFolders();
    const List<Album> albumList = [Album(name: '', noOfSongs: 1)];
    blocTest(
        'should emit a true loading state, list of album and false loading state',
        build: () {
          MusicBloc musicBloc = MusicBloc(
              getAllMusic: getAllMusic,
              getArtist: getArtist,
              getAlbums: getAlbums,
              getFolder: getFolder);

          when(getAlbums()).thenAnswer((_) async => const Right(albumList));
          return musicBloc;
        },
        act: (MusicBloc musicBloc) {
          musicBloc.add(GetAlbumEvent());
        },
        expect: () => [
              MusicState.initial().copyWith(isAlbumLoading: true),
              MusicState.initial().copyWith(
                  isArtistLoading: false,
                  albumFailureOrSuccess: some(
                    const Right(albumList),
                  ))
            ],
        verify: (MusicBloc musicBloc) {
          verify(getAlbums());
        });

    blocTest(
        'should emit a true loading state, a failure and false loading state',
        build: () {
          MusicBloc musicBloc = MusicBloc(
              getAllMusic: getAllMusic,
              getArtist: getArtist,
              getAlbums: getAlbums,
              getFolder: getFolder);

          when(getAlbums()).thenAnswer((_) async => Left(SystemFailure()));
          return musicBloc;
        },
        act: (MusicBloc musicBloc) {
          musicBloc.add(GetAlbumEvent());
        },
        expect: () => [
              MusicState.initial().copyWith(isAlbumLoading: true),
              MusicState.initial().copyWith(
                  isAlbumLoading: false,
                  albumFailureOrSuccess: some(
                    Left(SystemFailure()),
                  ))
            ],
        verify: (MusicBloc musicBloc) {
          verify(getAlbums());
        });
  });

  // test for getFolderEvent
  group('getFolderEvent test', () {
    MockGetAllMusic getAllMusic = MockGetAllMusic();
    MockGetArtists getArtist = MockGetArtists();
    MockGetAlbums getAlbums = MockGetAlbums();
    MockGetFolders getFolder = MockGetFolders();
    const List<Folder> folderList = [Folder(name: '', noOfSongs: 1)];
    blocTest(
        'should emit a true loading state, list of folder and false loading state',
        build: () {
          MusicBloc musicBloc = MusicBloc(
              getAllMusic: getAllMusic,
              getArtist: getArtist,
              getAlbums: getAlbums,
              getFolder: getFolder);

          when(getFolder()).thenAnswer((_) async => const Right(folderList));
          return musicBloc;
        },
        act: (MusicBloc musicBloc) {
          musicBloc.add(GetFolderEvent());
        },
        expect: () => [
              MusicState.initial().copyWith(isFolderLoading: true),
              MusicState.initial().copyWith(
                  isFolderLoading: false,
                  folderFailureOrSuccess: some(
                    const Right(folderList),
                  ))
            ],
        verify: (MusicBloc musicBloc) {
          verify(getFolder());
        });

    blocTest(
        'should emit a true loading state, a failure and false loading state',
        build: () {
          MusicBloc musicBloc = MusicBloc(
              getAllMusic: getAllMusic,
              getArtist: getArtist,
              getAlbums: getAlbums,
              getFolder: getFolder);

          when(getFolder()).thenAnswer((_) async => Left(SystemFailure()));
          return musicBloc;
        },
        act: (MusicBloc musicBloc) {
          musicBloc.add(GetFolderEvent());
        },
        expect: () => [
              MusicState.initial().copyWith(isFolderLoading: true),
              MusicState.initial().copyWith(
                  isFolderLoading: false,
                  folderFailureOrSuccess: some(
                    Left(SystemFailure()),
                  ))
            ],
        verify: (MusicBloc musicBloc) {
          verify(getFolder());
        });
  });
}
