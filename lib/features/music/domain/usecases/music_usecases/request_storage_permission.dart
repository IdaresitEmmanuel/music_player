import 'package:music_player/features/music/domain/repositories/music_repository.dart';

class RequestStoragePermission {
  final MusicRepository repository;
  RequestStoragePermission(this.repository);

  Future<bool> call() async {
    return repository.requestStoragePermission();
  }
}
