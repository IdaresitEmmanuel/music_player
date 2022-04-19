import 'package:music_player/features/music/domain/entities/artist.dart';

class ArtistsModel extends Artist {
  const ArtistsModel({required String name, required String noOfSongs})
      : super(name: name, noOfSongs: noOfSongs);
}
