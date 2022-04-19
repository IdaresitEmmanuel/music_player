import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';

class GetArtists {
  final MusicRepository repository;
  GetArtists(this.repository);

  Future<Either<Failure, List<Artist>>> call() async {
    return repository.getArtists();
  }
}
