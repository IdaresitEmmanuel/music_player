import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicModel extends Music {
  const MusicModel({
    required int id,
    required String title,
    String? album,
    int? albumId,
    String? artist,
    int? artistId,
    int? dateAdded,
    int? duration,
    required String path,
    required String data,
    String? uri,
    required int size,
  }) : super(
            id: id,
            title: title,
            album: album,
            albumId: albumId,
            artist: artist,
            artistId: artistId,
            dateAdded: dateAdded,
            duration: duration,
            path: path,
            data: data,
            uri: uri,
            size: size);

  factory MusicModel.fromSongModel(SongModel song) => MusicModel(
      id: song.id,
      title: song.title,
      album: song.album,
      albumId: song.albumId,
      artist: song.artist,
      artistId: song.artistId,
      dateAdded: song.dateAdded,
      duration: song.duration,
      path: song.data,
      data: song.data,
      uri: song.uri,
      size: song.size);
}
