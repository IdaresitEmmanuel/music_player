import 'dart:typed_data';

import 'package:music_player/service_locator.dart';
import 'package:on_audio_query/on_audio_query.dart';

String getFolderName(String path) {
  var list = path.split('/');
  list.removeLast();
  return list.last;
}

String playListNoToString(int number) {
  if (number == 1) {
    return "$number Song";
  } else {
    return "$number Songs";
  }
}

Future<Uint8List?> getArtWork(int id) async {
  return sl<OnAudioQuery>()
      .queryArtwork(id, ArtworkType.ALBUM, format: ArtworkFormat.PNG);
}
