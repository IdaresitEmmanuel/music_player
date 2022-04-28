import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/data/datasources/music_data_source/music_local_data_source.dart';
import 'package:music_player/features/music/data/models/album_model.dart';
import 'package:music_player/features/music/data/models/artist_model.dart';
import 'package:music_player/features/music/data/models/folder_model.dart';
import 'package:music_player/features/music/data/models/music_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'music_local_data_source_test.mocks.dart';

@GenerateMocks([OnAudioQuery])
void main() {
  MockOnAudioQuery mockOnAudioQuery = MockOnAudioQuery();
  MusicLocalDataSourceImpl musicLocalDataSource =
      MusicLocalDataSourceImpl(audioRetriever: mockOnAudioQuery);
  const artist = 'artist';
  const album = 'album';
  final song = SongModel({
    "_id": 4,
    'artist': artist,
    'album': album,
    'title': 'the best song',
    "_size": 1,
    "_data": 'download/data'
  });
  List<SongModel> songList = [song];
  // test to retrieve music list
  test('should return a list of musicmodels', () async {
    final musicList = <MusicModel>[];
    for (var song in songList) {
      final musicModel = MusicModel.fromSongModel(song);
      musicList.add(musicModel);
    }
    when(mockOnAudioQuery.querySongs()).thenAnswer((_) async => songList);

    final result = await musicLocalDataSource.getAllMusic();
    verify(mockOnAudioQuery.querySongs());
    expect(result, musicList);
  });

  // test to retrieve artistList
  test('should return a list of artistmodels', () async {
    ArtistModel artist =
        ArtistModel({"artist": 'artist', "number_of_tracks": 4});

    List<ArtistModel> artistList = [artist];
    final tempArtistsList = <ArtistsModel>[];
    for (var artist in artistList) {
      final artistModel = ArtistsModel(
          name: artist.artist,
          noOfSongs: playListNoToString(artist.numberOfTracks ?? 0));
      tempArtistsList.add(artistModel);
    }
    when(mockOnAudioQuery.queryArtists()).thenAnswer((_) async => artistList);

    final result = await musicLocalDataSource.getArtists();
    verify(mockOnAudioQuery.queryArtists());
    expect(result, tempArtistsList);
  });

  // test to retrieve album list
  test('should return a list of albums models', () async {
    AlbumModel album = AlbumModel({"_id": 1, "album": 'album', "numsongs": 4});

    List<AlbumModel> albumList = [album];
    final tempAlbumList = <AlbumsModel>[];
    for (var album in albumList) {
      final albumsModel = AlbumsModel.fromModel(album);
      tempAlbumList.add(albumsModel);
    }
    when(mockOnAudioQuery.queryAlbums()).thenAnswer((_) async => albumList);

    final result = await musicLocalDataSource.getAlbums();
    verify(mockOnAudioQuery.queryAlbums());
    expect(result, tempAlbumList);
  });

  // test to retrieve folder list
  test('should return a list of folder models', () async {
    final folderModel = FolderModel(
      name: getFolderName(song.data),
      noOfSongs: playListNoToString(1),
    );
    final folderList = [folderModel];

    when(mockOnAudioQuery.querySongs()).thenAnswer((_) async => songList);

    final result = await musicLocalDataSource.getFolders();
    verify(mockOnAudioQuery.querySongs());
    expect(result, folderList);
  });

  // test to retrieve list of music by artist name
  test('should return a list of music models by artist name', () async {
    final musicList = <MusicModel>[];
    for (var song in songList) {
      final musicModel = MusicModel.fromSongModel(song);
      musicList.add(musicModel);
    }

    when(mockOnAudioQuery.querySongs()).thenAnswer((_) async => songList);

    final result = await musicLocalDataSource.getMusicByArtist(artist);
    verify(mockOnAudioQuery.querySongs());
    expect(result, musicList);
  });

  // test to retrieve list of music models by album name
  test('should return a list of music models by album name', () async {
    final musicList = <MusicModel>[];
    for (var song in songList) {
      final musicModel = MusicModel.fromSongModel(song);
      musicList.add(musicModel);
    }

    when(mockOnAudioQuery.querySongs()).thenAnswer((_) async => songList);

    final result = await musicLocalDataSource.getMusicByAlbum(album);
    verify(mockOnAudioQuery.querySongs());
    expect(result, musicList);
  });

  // test to retrieve music models by folder name
  test('should return a list of music models by album name', () async {
    const folder = 'download';

    final musicList = <MusicModel>[];
    for (var song in songList) {
      final musicModel = MusicModel.fromSongModel(song);
      musicList.add(musicModel);
    }

    when(mockOnAudioQuery.querySongs()).thenAnswer((_) async => songList);

    final result = await musicLocalDataSource.getMusicByFolder(folder);
    verify(mockOnAudioQuery.querySongs());
    expect(result, musicList);
  });
}
