import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/features/music/domain/utilities/helper_functions.dart';
import 'package:music_player/features/music/data/models/album_model.dart';
import 'package:music_player/features/music/data/models/artist_model.dart';
import 'package:music_player/features/music/data/models/folder_model.dart';
import 'package:music_player/features/music/data/models/music_model.dart';
import 'package:on_audio_query/on_audio_query.dart';

abstract class MusicLocalDataSource {
  /// Fetches music from local storage
  ///
  /// Throws a [SystemException] for all error code
  Future<List<MusicModel>> getAllMusic();

  /// Fetches artist from local storage
  ///
  /// Throws a [SystemException] for all error code
  Future<List<ArtistsModel>> getArtists();

  /// Fetches music albums from local storage
  ///
  /// Throws a [SystemException] for all error code
  Future<List<AlbumsModel>> getAlbums();

  /// Fetches music folders from local storage
  ///
  /// Throws a [SystemException] for all error code
  Future<List<FolderModel>> getFolders();

  /// Fetches music with same artist from local storage
  ///
  /// Throws a [SystemException] for all error code
  Future<List<MusicModel>> getMusicByArtist(String artist);

  /// Fetches music with same album from local storage
  ///
  /// Throws a [SystemException] for all error code
  Future<List<MusicModel>> getMusicByAlbum(String album);

  /// Fetches folder containing music file from local storage
  ///
  /// Throws a [SystemException] for all error code
  Future<List<MusicModel>> getMusicByFolder(String folder);
}

class MusicLocalDataSourceImpl extends MusicLocalDataSource {
  final OnAudioQuery audioRetriever;
  MusicLocalDataSourceImpl({required this.audioRetriever});
  @override
  Future<List<AlbumsModel>> getAlbums() async {
    final albumList = await audioRetriever
        .queryAlbums()
        .onError((error, stackTrace) => throw SystemException());
    final tempAlbumList = <AlbumsModel>[];
    for (var album in albumList) {
      final albumsModel = AlbumsModel.fromModel(album);
      if (album.numOfSongs != 0) {
        tempAlbumList.add(albumsModel);
      }
    }
    return tempAlbumList;
  }

  @override
  Future<List<MusicModel>> getAllMusic() async {
    final songs = await audioRetriever
        .querySongs()
        .onError((error, stackTrace) => throw SystemException());
    final musicList = <MusicModel>[];
    for (var song in songs) {
      final musicModel = MusicModel.fromSongModel(song);
      musicList.add(musicModel);
    }
    return musicList;
  }

  @override
  Future<List<ArtistsModel>> getArtists() async {
    final artistList = await audioRetriever
        .queryArtists()
        .onError((error, stackTrace) => throw SystemException());
    final tempArtistList = <ArtistsModel>[];
    for (var artist in artistList) {
      final artistsModel = ArtistsModel(
          name: artist.artist,
          noOfSongs: playListNoToString(artist.numberOfTracks ?? 0));
      if (artist.numberOfTracks != 0) {
        tempArtistList.add(artistsModel);
      }
    }
    return tempArtistList;
  }

  @override
  Future<List<FolderModel>> getFolders() async {
    final songs = await audioRetriever
        .querySongs()
        .onError((error, stackTrace) => throw SystemException());
    List<String> folderNames = [];
    List<FolderModel> folderList = [];

    //get all available folders with audios
    for (var song in songs) {
      final folderName = getFolderName(song.data);
      if (!folderNames.contains(folderName)) {
        folderNames.add(folderName);
      }
    }

    // get num of songs in each folder
    for (var folderName in folderNames) {
      int noOfSongs = 0;
      for (var song in songs) {
        final sFolderName = getFolderName(song.data);
        if (sFolderName == folderName) {
          noOfSongs++;
        }
      }
      if (noOfSongs != 0) {
        final folder = FolderModel(
            name: folderName, noOfSongs: playListNoToString(noOfSongs));
        folderList.add(folder);
      }
    }

    return folderList;
  }

  @override
  Future<List<MusicModel>> getMusicByAlbum(String album) async {
    final songs = await audioRetriever
        .querySongs()
        .onError((error, stackTrace) => throw SystemException());
    final tempMusicList = <MusicModel>[];
    for (var song in songs) {
      if (song.album == album) {
        final musicModel = MusicModel.fromSongModel(song);
        tempMusicList.add(musicModel);
      }
    }
    return tempMusicList;
  }

  @override
  Future<List<MusicModel>> getMusicByArtist(String artist) async {
    final songs = await audioRetriever
        .querySongs()
        .onError((error, stackTrace) => throw SystemException());
    final tempMusicList = <MusicModel>[];
    for (var song in songs) {
      if (song.artist == artist) {
        final musicModel = MusicModel.fromSongModel(song);
        tempMusicList.add(musicModel);
      }
    }
    return tempMusicList;
  }

  @override
  Future<List<MusicModel>> getMusicByFolder(String folder) async {
    final songs = await audioRetriever
        .querySongs()
        .onError((error, stackTrace) => throw SystemException());

    final tempMusicList = <MusicModel>[];
    for (var song in songs) {
      if (getFolderName(song.data) == folder) {
        final musicModel = MusicModel.fromSongModel(song);
        tempMusicList.add(musicModel);
      }
    }
    return tempMusicList;
  }
}
