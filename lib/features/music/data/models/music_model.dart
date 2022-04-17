import 'package:music_player/features/music/domain/entities/music.dart';

class MusicModel extends Music {
  const MusicModel(
      {required String title,
      required String artist,
      required String album,
      required String path})
      : super(album: album, artist: artist, title: title, path: path);
}
