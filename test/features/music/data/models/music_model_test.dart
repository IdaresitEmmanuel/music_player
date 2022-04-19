import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/features/music/data/models/music_model.dart';
import 'package:music_player/features/music/domain/entities/music.dart';

void main() {
  const musicModel =
      MusicModel(id: 1, title: 'title', path: 'path', data: 'data', size: 9);

  test('should be a subclass of Music entity', () async {
    expect(musicModel, isA<Music>());
  });
}
