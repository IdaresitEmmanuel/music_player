import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_folders.dart';

import 'get_folders_test.mocks.dart';

@GenerateMocks([MusicRepository])
void main() {
  MockMusicRepository mockMusicRepo = MockMusicRepository();
  GetFolders usecase = GetFolders(mockMusicRepo);

  test('should return a List of Folder entities', () async {
    final folder = Folder(name: 'download', noOfSongs: playListNoToString(4));
    List<Folder> folderList = [folder];

    when(mockMusicRepo.getFolders()).thenAnswer((_) async => Right(folderList));

    final result = await usecase();

    expect(result, Right(folderList));
    verify(mockMusicRepo.getFolders());
    verifyNoMoreInteractions(mockMusicRepo);
  });
}
