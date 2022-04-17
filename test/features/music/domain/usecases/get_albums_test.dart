import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart';
import 'package:music_player/features/music/domain/usecases/get_albums.dart';

import 'get_albums_test.mocks.dart';

@GenerateMocks([MusicRepository])
void main() {
  MockMusicRepository mockMusicRepo = MockMusicRepository();
  GetAlbums usecase = GetAlbums(mockMusicRepo);

  test('should return a List of Album entities', () async {
    const album = Album(name: 'blues', noOfSongs: 5);
    List<Album> albumList = [album];

    when(mockMusicRepo.getAlbums()).thenAnswer((_) async => Right(albumList));

    final result = await usecase();

    expect(result, Right(albumList));
    verify(mockMusicRepo.getAlbums());
    verifyNoMoreInteractions(mockMusicRepo);
  });
}
