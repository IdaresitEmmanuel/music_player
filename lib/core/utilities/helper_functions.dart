import 'dart:typed_data';

import 'package:audio_service/audio_service.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
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

List<MediaItem> musicToMediaItem(List<Music> music) {
  final mediaItems = music
      .map((song) => MediaItem(
              id: song.id.toString(),
              title: song.title,
              artist: song.artist,
              album: song.album,
              // artUri: Ur,
              extras: {
                'uri': Uri.parse(song.uri!),
                'path': song.path,
                'size': song.size,
                'albumId': song.albumId,
              }))
      .toList();
  return mediaItems;
}

List<Music> mediaItemToMusic(List<MediaItem> mediaItems) {
  final musicList = mediaItems
      .map((mediaItem) => Music(
          id: int.parse(mediaItem.id),
          title: mediaItem.title,
          artist: mediaItem.artist,
          albumId: mediaItem.extras!['albumId'],
          uri: mediaItem.extras!['uri'].toString(),
          path: mediaItem.extras!['path'],
          data: mediaItem.extras!['path'],
          size: mediaItem.extras!['size']))
      .toList();
  return musicList;
}