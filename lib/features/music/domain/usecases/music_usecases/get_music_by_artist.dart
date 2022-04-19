import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';

class GetMusicByArtist {
  final MusicRepository repository;
  GetMusicByArtist(this.repository);

  Future<Either<Failure, List<Music>>> call(String artist) async {
    return repository.getMusicByArtist(artist);
  }
}
