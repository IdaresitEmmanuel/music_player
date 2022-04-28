import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_artists.dart';

import 'get_artists_test.mocks.dart';

@GenerateMocks([MusicRepository])
void main() {
  MockMusicRepository mockMusicRepo = MockMusicRepository();
  GetArtists usecase = GetArtists(mockMusicRepo);

  test('should return a list of artist entities', () async {
    final artist =
        Artist(name: 'Artist name', noOfSongs: playListNoToString(4));
    List<Artist> artistList = [artist];

    when(mockMusicRepo.getArtists()).thenAnswer((_) async => Right(artistList));

    final result = await usecase();

    expect(result, Right(artistList));
    verify(mockMusicRepo.getArtists());
    verifyNoMoreInteractions(mockMusicRepo);
  });
}
