import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';

class GetMusicByFolder {
  final MusicRepository repository;
  GetMusicByFolder(this.repository);

  Future<Either<Failure, List<Music>>> call(String folder) async {
    return repository.getMusicByFolder(folder);
  }
}
