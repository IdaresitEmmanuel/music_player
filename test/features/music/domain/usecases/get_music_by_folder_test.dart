import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_folder.dart';

import 'get_music_by_folder_test.mocks.dart';

@GenerateMocks([MusicRepository])
void main() {
  MockMusicRepository mockMusicRepo = MockMusicRepository();
  GetMusicByFolder usecase = GetMusicByFolder(mockMusicRepo);

  test('should get a list of music from repository by folder name', () async {
    const music = Music(
        title: 'cruise', album: 'unknown', artist: 'me', path: '://directory');
    List<Music> musicList = [music];
    String folder = "download";
    when(mockMusicRepo.getMusicByFolder(folder))
        .thenAnswer((realInvocation) async => Right(musicList));

    final result = await usecase(folder);

    expect(result, Right(musicList));
    verify(mockMusicRepo.getMusicByFolder(folder));
    verifyNoMoreInteractions(mockMusicRepo);
  });
}
