import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart';
import 'package:music_player/features/music/domain/usecases/get_music_by_artist.dart';

import 'get_music_by_artist_test.mocks.dart';

@GenerateMocks([MusicRepository])
void main() {
  MockMusicRepository mockMusicRepo = MockMusicRepository();
  GetMusicByArtist usecase = GetMusicByArtist(mockMusicRepo);

  test('should get a list of music from repository by artist name', () async {
    const music = Music(
        title: 'cruise', album: 'unknown', artist: 'me', path: '://directory');
    List<Music> musicList = [music];
    String artist = "james";
    when(mockMusicRepo.getMusicByArtist(artist))
        .thenAnswer((realInvocation) async => Right(musicList));

    final result = await usecase(artist);

    expect(result, Right(musicList));
    verify(mockMusicRepo.getMusicByArtist(artist));
    verifyNoMoreInteractions(mockMusicRepo);
  });
}
