import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';

class GetAllMusic {
  final MusicRepository repository;
  GetAllMusic(this.repository);

  Future<Either<Failure, List<Music>>> call() async {
    return repository.getAllMusic();
  }
}
