import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/features/music/data/models/album_model.dart';
import 'package:music_player/features/music/domain/entities/album.dart';

void main() {
  const albumModel = AlbumsModel(name: 'album', noOfSongs: 4);

  test('should be a subclass of Album entity', () async {
    expect(albumModel, isA<Album>());
  });
}
