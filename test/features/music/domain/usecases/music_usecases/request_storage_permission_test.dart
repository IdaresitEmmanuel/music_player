import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/request_storage_permission.dart';

import 'request_storage_permission_test.mocks.dart';

@GenerateMocks([MusicRepository])
void main() {
  MockMusicRepository mockMusicRepo = MockMusicRepository();
  RequestStoragePermission usecase = RequestStoragePermission(mockMusicRepo);

  test('request storage permission test', () async {
    when(mockMusicRepo.requestStoragePermission())
        .thenAnswer((_) async => true);

    final result = await usecase();

    expect(result, true);
    verify(mockMusicRepo.requestStoragePermission());
    verifyNoMoreInteractions(mockMusicRepo);
  });
}
