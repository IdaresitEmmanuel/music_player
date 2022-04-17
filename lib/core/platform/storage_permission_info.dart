import 'package:on_audio_query/on_audio_query.dart';

abstract class StoragePermissionInfo {
  Future<bool> get hasPermission;
  Future<bool> requestStoragePermission();
}

class StoragePermissionInfoImpl extends StoragePermissionInfo {
  final OnAudioQuery permissionCaller;
  StoragePermissionInfoImpl({required this.permissionCaller});
  @override
  Future<bool> get hasPermission async => permissionCaller.permissionsStatus();

  @override
  Future<bool> requestStoragePermission() async =>
      permissionCaller.permissionsRequest();
}
