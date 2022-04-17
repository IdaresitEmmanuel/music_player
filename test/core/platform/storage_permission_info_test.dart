import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/platform/storage_permission_info.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../features/music/data/datasources/music_local_data_source_test.mocks.dart';

@GenerateMocks([OnAudioQuery])
void main() {
  MockOnAudioQuery mockOnAudioQuery = MockOnAudioQuery();
  StoragePermissionInfoImpl storagePermission =
      StoragePermissionInfoImpl(permissionCaller: mockOnAudioQuery);

  // test to check permission status
  test('should return a bool to identify the permission status', () async {
    when(mockOnAudioQuery.permissionsStatus()).thenAnswer((_) async => true);
    final result = await storagePermission.hasPermission;
    expect(result, true);
    verify(mockOnAudioQuery.permissionsStatus());
  });

  // test to request storage permission
  test('should return a bool after requesting for storage permission',
      () async {
    when(mockOnAudioQuery.permissionsRequest()).thenAnswer((_) async => true);
    final result = await storagePermission.requestStoragePermission();
    expect(result, true);
    verify(mockOnAudioQuery.permissionsRequest());
  });
}
