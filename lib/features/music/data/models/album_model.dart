import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/utilities/helper_functions.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumsModel extends Album {
  const AlbumsModel(
      {required int id, required String name, required String noOfSongs})
      : super(id: id, name: name, noOfSongs: noOfSongs);

  factory AlbumsModel.fromModel(AlbumModel model) => AlbumsModel(
      id: model.id,
      name: model.album,
      noOfSongs: playListNoToString(model.numOfSongs));
}
