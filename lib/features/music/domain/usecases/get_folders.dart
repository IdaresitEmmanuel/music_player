import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart';

class GetFolders {
  final MusicRepository repository;
  GetFolders(this.repository);

  Future<Either<Failure, List<Folder>>> call() async {
    return repository.getFolders();
  }
}
