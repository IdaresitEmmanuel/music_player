import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/entities/music.dart';

abstract class MusicRepository {
  Future<Either<Failure, List<Music>>> getAllMusic();
  Future<Either<Failure, List<Music>>> getMusicByArtist(String artist);
  Future<Either<Failure, List<Music>>> getMusicByAlbum(String album);
  Future<Either<Failure, List<Music>>> getMusicByFolder(String folder);
  Future<Either<Failure, List<Artist>>> getArtists();
  Future<Either<Failure, List<Album>>> getAlbums();
  Future<Either<Failure, List<Folder>>> getFolders();
}
