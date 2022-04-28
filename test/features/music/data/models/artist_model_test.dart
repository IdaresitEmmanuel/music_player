import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/data/models/artist_model.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';

void main() {
  final artistModel =
      ArtistsModel(name: 'artist', noOfSongs: playListNoToString(4));

  test('should be a subclass of Artist entity', () async {
    expect(artistModel, isA<Artist>());
  });
}
