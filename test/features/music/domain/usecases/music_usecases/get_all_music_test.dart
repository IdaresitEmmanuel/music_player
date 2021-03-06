import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_all_music.dart';

import 'get_all_music_test.mocks.dart';

@GenerateMocks([MusicRepository])
void main() {
  MockMusicRepository mockMusicRepo = MockMusicRepository();
  GetAllMusic usecase = GetAllMusic(mockMusicRepo);

  test('should get a list of music from repository', () async {
    const music = Music(id: 2, title: '', path: '', data: '', size: 5);
    List<Music> musicList = [music];

    when(mockMusicRepo.getAllMusic())
        .thenAnswer((realInvocation) async => Right(musicList));

    final result = await usecase();

    expect(result, Right(musicList));
    verify(mockMusicRepo.getAllMusic());
    verifyNoMoreInteractions(mockMusicRepo);
  });
}
