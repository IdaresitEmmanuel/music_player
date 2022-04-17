import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/platform/storage_permission_info.dart';
import 'package:music_player/features/music/data/datasources/music_local_data_source.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart';

class MusicRepositoryImpl extends MusicRepository {
  MusicLocalDataSource dataSource;
  StoragePermissionInfo storagePermissionInfo;
  MusicRepositoryImpl(
      {required this.dataSource, required this.storagePermissionInfo});
  @override
  Future<Either<Failure, List<Album>>> getAlbums() async {
    if (await storagePermissionInfo.hasPermission) {
      try {
        return Right(await dataSource.getAlbums());
      } on SystemException {
        return Left(SystemFailure());
      }
    } else {
      return Left(StoragePermissionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Music>>> getAllMusic() async {
    if (await storagePermissionInfo.hasPermission) {
      try {
        return Right(await dataSource.getAllMusic());
      } on SystemException {
        return Left(SystemFailure());
      }
    } else {
      return Left(StoragePermissionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Artist>>> getArtists() async {
    if (await storagePermissionInfo.hasPermission) {
      try {
        return Right(await dataSource.getArtists());
      } on SystemException {
        return Left(SystemFailure());
      }
    } else {
      return Left(StoragePermissionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Folder>>> getFolders() async {
    if (await storagePermissionInfo.hasPermission) {
      try {
        return Right(await dataSource.getFolders());
      } on SystemException {
        return Left(SystemFailure());
      }
    } else {
      return Left(StoragePermissionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Music>>> getMusicByAlbum(String album) async {
    if (await storagePermissionInfo.hasPermission) {
      try {
        return Right(await dataSource.getMusicByAlbum(album));
      } on SystemException {
        return Left(SystemFailure());
      }
    } else {
      return Left(StoragePermissionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Music>>> getMusicByArtist(String artist) async {
    if (await storagePermissionInfo.hasPermission) {
      try {
        return Right(await dataSource.getMusicByArtist(artist));
      } on SystemException {
        return Left(SystemFailure());
      }
    } else {
      return Left(StoragePermissionFailure());
    }
  }

  @override
  Future<Either<Failure, List<Music>>> getMusicByFolder(String folder) async {
    if (await storagePermissionInfo.hasPermission) {
      try {
        return Right(await dataSource.getMusicByFolder(folder));
      } on SystemException {
        return Left(SystemFailure());
      }
    } else {
      return Left(StoragePermissionFailure());
    }
  }
}
