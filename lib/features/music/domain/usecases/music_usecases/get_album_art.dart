import 'dart:typed_data';
import 'package:on_audio_query/on_audio_query.dart';

class GetAlbumArt {
  final OnAudioQuery artQuery;
  GetAlbumArt(this.artQuery);

  Future<Uint8List?> call(int id) async {
    return artQuery.queryArtwork(id, ArtworkType.ALBUM);
  }
}
