import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/features/music/data/models/music_model.dart';
import 'package:music_player/features/music/domain/entities/music.dart';

void main() {
  const musicModel = MusicModel(
      title: 'music', artist: 'hnn', album: 'cruise', path: 'directory');

  test('should be a subclass of Music entity', () async {
    expect(musicModel, isA<Music>());
  });
}
