import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/core/platform/storage_permission_info.dart';
import 'package:music_player/core/utility/helper_functions.dart';
import 'package:music_player/features/music/data/datasources/music_local_data_source.dart';
import 'package:music_player/features/music/data/models/album_model.dart';
import 'package:music_player/features/music/data/models/artist_model.dart';
import 'package:music_player/features/music/data/models/folder_model.dart';
import 'package:music_player/features/music/data/models/music_model.dart';
import 'package:music_player/features/music/data/repositories/music_repository_impl.dart';

import 'music_repository_impl_test.mocks.dart';

@GenerateMocks(
    [MusicLocalDataSource, MusicRepositoryImpl, StoragePermissionInfo])
void main() {
  // test to request for storage permission
  test('should make a storage permission request', () async {
    MockMusicLocalDataSource dataSource = MockMusicLocalDataSource();
    MockStoragePermissionInfo mockStoragePermissionInfo =
        MockStoragePermissionInfo();
    MusicRepositoryImpl repo = MusicRepositoryImpl(
        dataSource: dataSource,
        storagePermissionInfo: mockStoragePermissionInfo);

    when(mockStoragePermissionInfo.requestStoragePermission())
        .thenAnswer((_) async => true);
    final result = await repo.requestStoragePermission();

    expect(result, true);
    verify(mockStoragePermissionInfo.requestStoragePermission());
  });
  //test to retrive all music files
  group('get all music', () {
    MockMusicLocalDataSource dataSource = MockMusicLocalDataSource();
    MockStoragePermissionInfo mockStoragePermissionInfo =
        MockStoragePermissionInfo();
    MusicRepositoryImpl repo = MusicRepositoryImpl(
        dataSource: dataSource,
        storagePermissionInfo: mockStoragePermissionInfo);
    const MusicModel musicModel = MusicModel(
        title: 'title', artist: 'artist', album: 'album', path: 'path');
    List<MusicModel> musicModelList = [musicModel];

    test('should check for storage permission', () async {
      //arrange
      when(dataSource.getAllMusic()).thenAnswer((_) async => musicModelList);

      when(mockStoragePermissionInfo.hasPermission)
          .thenAnswer((_) async => true);
      // act
      repo.getAllMusic();
      // // assert
      verify(mockStoragePermissionInfo.hasPermission);
    });

    group('storage has permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => true);
      });

      test(
          'should return a list of music when call to local data source is successful',
          () async {
        when(dataSource.getAllMusic()).thenAnswer((_) async => musicModelList);

        final result = await repo.getAllMusic();

        verify(dataSource.getAllMusic());
        expect(result, equals(Right(musicModelList)));
      });

      test(
          'should throw a system Exception when call to local data source is unsuccessful',
          () async {
        when(dataSource.getAllMusic()).thenThrow(SystemException());

        final result = await repo.getAllMusic();

        verify(dataSource.getAllMusic());
        expect(result, equals(Left(SystemFailure())));
      });
    });

    group('storage has no permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => false);
      });

      test('should return a storageFailure when storage permission is false',
          () async {
        when(dataSource.getAllMusic()).thenAnswer((_) async => musicModelList);

        final result = await repo.getAllMusic();

        verifyNever(dataSource.getAllMusic());
        expect(result, equals(Left(StoragePermissionFailure())));
      });
    });
  });

  // test to retrieve all artist
  group('get all artists', () {
    MockMusicLocalDataSource dataSource = MockMusicLocalDataSource();
    MockStoragePermissionInfo mockStoragePermissionInfo =
        MockStoragePermissionInfo();
    MusicRepositoryImpl repo = MusicRepositoryImpl(
        dataSource: dataSource,
        storagePermissionInfo: mockStoragePermissionInfo);
    final ArtistsModel artistModel =
        ArtistsModel(name: 'title', noOfSongs: playListNoToString(4));
    List<ArtistsModel> artistModelList = [artistModel];

    test('should check for storage permission', () async {
      //arrange
      when(dataSource.getArtists()).thenAnswer((_) async => artistModelList);

      when(mockStoragePermissionInfo.hasPermission)
          .thenAnswer((_) async => true);
      // act
      repo.getArtists();
      // // assert
      verify(mockStoragePermissionInfo.hasPermission);
    });

    group('storage has permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => true);
      });

      test(
          'should return a list of artist when call to local data source is successful',
          () async {
        when(dataSource.getArtists()).thenAnswer((_) async => artistModelList);

        final result = await repo.getArtists();

        verify(dataSource.getArtists());
        expect(result, equals(Right(artistModelList)));
      });

      test(
          'should throw a system Exception when call to local data source is unsuccessful',
          () async {
        when(dataSource.getArtists()).thenThrow(SystemException());

        final result = await repo.getArtists();

        verify(dataSource.getArtists());
        expect(result, equals(Left(SystemFailure())));
      });
    });

    group('storage has no permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => false);
      });

      test('should return a storageFailure when storage permission is false',
          () async {
        when(dataSource.getArtists()).thenAnswer((_) async => artistModelList);

        final result = await repo.getArtists();

        verifyNever(dataSource.getArtists());
        expect(result, equals(Left(StoragePermissionFailure())));
      });
    });
  });

  // test to retrieve all album
  group('get all albums', () {
    MockMusicLocalDataSource dataSource = MockMusicLocalDataSource();
    MockStoragePermissionInfo mockStoragePermissionInfo =
        MockStoragePermissionInfo();
    MusicRepositoryImpl repo = MusicRepositoryImpl(
        dataSource: dataSource,
        storagePermissionInfo: mockStoragePermissionInfo);
    final AlbumsModel albumModel =
        AlbumsModel(name: 'title', noOfSongs: playListNoToString(4));
    List<AlbumsModel> albumModelList = [albumModel];

    test('should check for storage permission', () async {
      //arrange
      when(dataSource.getAlbums()).thenAnswer((_) async => albumModelList);

      when(mockStoragePermissionInfo.hasPermission)
          .thenAnswer((_) async => true);
      // act
      repo.getAlbums();
      // // assert
      verify(mockStoragePermissionInfo.hasPermission);
    });

    group('storage has permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => true);
      });

      test(
          'should return a list of albums when call to local data source is successful',
          () async {
        when(dataSource.getAlbums()).thenAnswer((_) async => albumModelList);

        final result = await repo.getAlbums();

        verify(dataSource.getAlbums());
        expect(result, equals(Right(albumModelList)));
      });

      test(
          'should throw a system Exception when call to local data source is unsuccessful',
          () async {
        when(dataSource.getAlbums()).thenThrow(SystemException());

        final result = await repo.getAlbums();

        verify(dataSource.getAlbums());
        expect(result, equals(Left(SystemFailure())));
      });
    });

    group('storage has no permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => false);
      });

      test('should return a storageFailure when storage permission is false',
          () async {
        when(dataSource.getAlbums()).thenAnswer((_) async => albumModelList);

        final result = await repo.getAlbums();

        verifyNever(dataSource.getAlbums());
        expect(result, equals(Left(StoragePermissionFailure())));
      });
    });
  });

  // test to retrieve all folders with music files
  group('get all folders', () {
    MockMusicLocalDataSource dataSource = MockMusicLocalDataSource();
    MockStoragePermissionInfo mockStoragePermissionInfo =
        MockStoragePermissionInfo();
    MusicRepositoryImpl repo = MusicRepositoryImpl(
        dataSource: dataSource,
        storagePermissionInfo: mockStoragePermissionInfo);
    final FolderModel folderModel =
        FolderModel(name: 'title', noOfSongs: playListNoToString(4));
    List<FolderModel> folderModelList = [folderModel];

    test('should check for storage permission', () async {
      //arrange
      when(dataSource.getFolders()).thenAnswer((_) async => folderModelList);

      when(mockStoragePermissionInfo.hasPermission)
          .thenAnswer((_) async => true);
      // act
      repo.getFolders();
      // // assert
      verify(mockStoragePermissionInfo.hasPermission);
    });

    group('storage has permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => true);
      });

      test(
          'should return a list of folders when call to local data source is successful',
          () async {
        when(dataSource.getFolders()).thenAnswer((_) async => folderModelList);

        final result = await repo.getFolders();

        verify(dataSource.getFolders());
        expect(result, equals(Right(folderModelList)));
      });

      test(
          'should throw a system Exception when call to local data source is unsuccessful',
          () async {
        when(dataSource.getFolders()).thenThrow(SystemException());

        final result = await repo.getFolders();

        verify(dataSource.getFolders());
        expect(result, equals(Left(SystemFailure())));
      });
    });

    group('storage has no permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => false);
      });

      test('should return a storageFailure when storage permission is false',
          () async {
        when(dataSource.getFolders()).thenAnswer((_) async => folderModelList);

        final result = await repo.getFolders();

        verifyNever(dataSource.getFolders());
        expect(result, equals(Left(StoragePermissionFailure())));
      });
    });
  });

  // test to retrieve all music file by artist name
  group('get music by artist name', () {
    MockMusicLocalDataSource dataSource = MockMusicLocalDataSource();
    MockStoragePermissionInfo mockStoragePermissionInfo =
        MockStoragePermissionInfo();
    MusicRepositoryImpl repo = MusicRepositoryImpl(
        dataSource: dataSource,
        storagePermissionInfo: mockStoragePermissionInfo);
    const MusicModel musicModel = MusicModel(
        title: 'title', artist: 'artist', album: 'album', path: 'path');
    List<MusicModel> musicModelList = [musicModel];
    const artistName = 'artist';

    test('should check for storage permission', () async {
      //arrange
      when(dataSource.getMusicByArtist(artistName))
          .thenAnswer((_) async => musicModelList);

      when(mockStoragePermissionInfo.hasPermission)
          .thenAnswer((_) async => true);
      // act
      repo.getMusicByArtist(artistName);
      // // assert
      verify(mockStoragePermissionInfo.hasPermission);
    });

    group('storage has permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => true);
      });

      test(
          'should return a list of music when call to local data source is successful',
          () async {
        when(dataSource.getMusicByArtist(artistName))
            .thenAnswer((_) async => musicModelList);

        final result = await repo.getMusicByArtist(artistName);

        verify(dataSource.getMusicByArtist(artistName));
        expect(result, equals(Right(musicModelList)));
      });

      test(
          'should throw a system Exception when call to local data source is unsuccessful',
          () async {
        when(dataSource.getMusicByArtist(artistName))
            .thenThrow(SystemException());

        final result = await repo.getMusicByArtist(artistName);

        verify(dataSource.getMusicByArtist(artistName));
        expect(result, equals(Left(SystemFailure())));
      });
    });

    group('storage has no permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => false);
      });

      test('should return a storageFailure when storage permission is false',
          () async {
        when(dataSource.getMusicByArtist(artistName))
            .thenAnswer((_) async => musicModelList);

        final result = await repo.getMusicByArtist(artistName);

        verifyNever(dataSource.getMusicByArtist(artistName));
        expect(result, equals(Left(StoragePermissionFailure())));
      });
    });
  });

  // test to retrieve all music files by album name
  group('get music by album name', () {
    MockMusicLocalDataSource dataSource = MockMusicLocalDataSource();
    MockStoragePermissionInfo mockStoragePermissionInfo =
        MockStoragePermissionInfo();
    MusicRepositoryImpl repo = MusicRepositoryImpl(
        dataSource: dataSource,
        storagePermissionInfo: mockStoragePermissionInfo);
    const MusicModel musicModel = MusicModel(
        title: 'title', artist: 'artist', album: 'album', path: 'path');
    List<MusicModel> musicModelList = [musicModel];
    const albumName = 'album';

    test('should check for storage permission', () async {
      //arrange
      when(dataSource.getMusicByAlbum(albumName))
          .thenAnswer((_) async => musicModelList);

      when(mockStoragePermissionInfo.hasPermission)
          .thenAnswer((_) async => true);
      // act
      repo.getMusicByAlbum(albumName);
      // // assert
      verify(mockStoragePermissionInfo.hasPermission);
    });

    group('storage has permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => true);
      });

      test(
          'should return a list of music when call to local data source is successful',
          () async {
        when(dataSource.getMusicByAlbum(albumName))
            .thenAnswer((_) async => musicModelList);

        final result = await repo.getMusicByAlbum(albumName);

        verify(dataSource.getMusicByAlbum(albumName));
        expect(result, equals(Right(musicModelList)));
      });

      test(
          'should throw a system Exception when call to local data source is unsuccessful',
          () async {
        when(dataSource.getMusicByAlbum(albumName))
            .thenThrow(SystemException());

        final result = await repo.getMusicByAlbum(albumName);

        verify(dataSource.getMusicByAlbum(albumName));
        expect(result, equals(Left(SystemFailure())));
      });
    });

    group('storage has no permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => false);
      });

      test('should return a storageFailure when storage permission is false',
          () async {
        when(dataSource.getMusicByAlbum(albumName))
            .thenAnswer((_) async => musicModelList);

        final result = await repo.getMusicByAlbum(albumName);

        verifyNever(dataSource.getMusicByAlbum(albumName));
        expect(result, equals(Left(StoragePermissionFailure())));
      });
    });
  });

  // test to retrieve all music files by folder name
  group('get music by folder name', () {
    MockMusicLocalDataSource dataSource = MockMusicLocalDataSource();
    MockStoragePermissionInfo mockStoragePermissionInfo =
        MockStoragePermissionInfo();
    MusicRepositoryImpl repo = MusicRepositoryImpl(
        dataSource: dataSource,
        storagePermissionInfo: mockStoragePermissionInfo);
    const MusicModel musicModel = MusicModel(
        title: 'title', artist: 'artist', album: 'album', path: 'path');
    List<MusicModel> musicModelList = [musicModel];
    const folderName = 'folder';

    test('should check for storage permission', () async {
      //arrange
      when(dataSource.getMusicByFolder(folderName))
          .thenAnswer((_) async => musicModelList);

      when(mockStoragePermissionInfo.hasPermission)
          .thenAnswer((_) async => true);
      // act
      repo.getMusicByFolder(folderName);
      // // assert
      verify(mockStoragePermissionInfo.hasPermission);
    });

    group('storage has permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => true);
      });

      test(
          'should return a list of music when call to local data source is successful',
          () async {
        when(dataSource.getMusicByFolder(folderName))
            .thenAnswer((_) async => musicModelList);

        final result = await repo.getMusicByFolder(folderName);

        verify(dataSource.getMusicByFolder(folderName));
        expect(result, equals(Right(musicModelList)));
      });

      test(
          'should throw a system Exception when call to local data source is unsuccessful',
          () async {
        when(dataSource.getMusicByFolder(folderName))
            .thenThrow(SystemException());

        final result = await repo.getMusicByFolder(folderName);

        verify(dataSource.getMusicByFolder(folderName));
        expect(result, equals(Left(SystemFailure())));
      });
    });

    group('storage has no permission', () {
      setUp(() {
        when(mockStoragePermissionInfo.hasPermission)
            .thenAnswer((_) async => false);
      });

      test('should return a storageFailure when storage permission is false',
          () async {
        when(dataSource.getMusicByFolder(folderName))
            .thenAnswer((_) async => musicModelList);

        final result = await repo.getMusicByFolder(folderName);

        verifyNever(dataSource.getMusicByFolder(folderName));
        expect(result, equals(Left(StoragePermissionFailure())));
      });
    });
  });
}
