import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart';

class GetAlbums {
  final MusicRepository repository;
  GetAlbums(this.repository);

  Future<Either<Failure, List<Album>>> call() async {
    return repository.getAlbums();
  }
}
