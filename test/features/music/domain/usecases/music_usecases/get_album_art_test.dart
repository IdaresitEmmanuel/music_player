import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_album_art.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'get_album_art_test.mocks.dart';

@GenerateMocks([OnAudioQuery])
void main() {
  MockOnAudioQuery mockOnAudioQuery = MockOnAudioQuery();
  GetAlbumArt usecase = GetAlbumArt(mockOnAudioQuery);

  test('should return an image in form of Uint8List', () async {
    int id = 1;
    var image = Uint8List(4);

    when(mockOnAudioQuery.queryArtwork(id, ArtworkType.ALBUM))
        .thenAnswer((_) async => image);

    final result = await usecase(id);

    expect(result, image);
    verify(mockOnAudioQuery.queryArtwork(id, ArtworkType.ALBUM));
    verifyNoMoreInteractions(mockOnAudioQuery);
  });
}
