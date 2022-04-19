import 'package:get_it/get_it.dart';
import 'package:music_player/core/platform/storage_permission_info.dart';
import 'package:music_player/features/music/data/datasources/music_local_data_source.dart';
import 'package:music_player/features/music/data/repositories/music_repository_impl.dart';
import 'package:music_player/features/music/domain/repositories/music_reporitory.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_albums.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_all_music.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_artists.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_folders.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_album.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_artist.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_folder.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/request_storage_permission.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

final sl = GetIt.instance;

void init() {
  // ! Features
  // bloc
  sl.registerFactory(() => MusicBloc(
      getAllMusic: sl(),
      getArtist: sl(),
      getAlbums: sl(),
      getFolder: sl(),
      requestStoragePermission: sl()));

  // usecases
  sl.registerLazySingleton(() => GetAlbums(sl()));
  sl.registerLazySingleton(() => GetAllMusic(sl()));
  sl.registerLazySingleton(() => GetArtists(sl()));
  sl.registerLazySingleton(() => GetFolders(sl()));
  sl.registerLazySingleton(() => GetMusicByAlbum(sl()));
  sl.registerLazySingleton(() => GetMusicByArtist(sl()));
  sl.registerLazySingleton(() => GetMusicByFolder(sl()));
  sl.registerLazySingleton(() => RequestStoragePermission(sl()));

  // repositories

  sl.registerLazySingleton<MusicRepository>(
      () => MusicRepositoryImpl(dataSource: sl(), storagePermissionInfo: sl()));

  // datasources
  sl.registerLazySingleton<MusicLocalDataSource>(
      () => MusicLocalDataSourceImpl(audioRetriever: sl()));

  // ! Core
  sl.registerLazySingleton<StoragePermissionInfo>(
      () => StoragePermissionInfoImpl(permissionCaller: sl()));

  // ! External
  sl.registerLazySingleton(() => OnAudioQuery());
}
