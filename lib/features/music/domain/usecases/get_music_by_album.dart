import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart';

class GetMusicByAlbum {
  final MusicRepository repository;
  GetMusicByAlbum(this.repository);

  Future<Either<Failure, List<Music>>> call(String album) async {
    return repository.getMusicByAlbum(album);
  }
}
