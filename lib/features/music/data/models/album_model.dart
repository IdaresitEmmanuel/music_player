import 'package:music_player/features/music/domain/entities/album.dart';

class AlbumsModel extends Album {
  const AlbumsModel({required String name, required String noOfSongs})
      : super(name: name, noOfSongs: noOfSongs);
}
