import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/core/platform/storage_permission_info.dart';
import 'package:music_player/features/music/data/datasources/music_data_source/music_local_data_source.dart';
import 'package:music_player/features/music/data/datasources/search_data_source/search_data_source.dart';
import 'package:music_player/features/music/data/datasources/settings_data_source/settings_local_data_source.dart';
import 'package:music_player/features/music/data/repositories/music_repository_impl.dart';
import 'package:music_player/features/music/data/repositories/search_repository_impl.dart';
import 'package:music_player/features/music/data/repositories/settings_repository_impl.dart';
import 'package:music_player/features/music/domain/repositories/music_repository.dart';
import 'package:music_player/features/music/domain/repositories/search_repository.dart';
import 'package:music_player/features/music/domain/repositories/settings_repository.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_album_art.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_albums.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_all_music.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_artists.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_folders.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_album.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_artist.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_folder.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/request_storage_permission.dart';
import 'package:music_player/features/music/domain/usecases/search_usecases/get_search_category.dart';
import 'package:music_player/features/music/domain/usecases/search_usecases/set_search_category.dart';
import 'package:music_player/features/music/domain/usecases/settings_usecases/get_theme.dart';
import 'package:music_player/features/music/domain/usecases/settings_usecases/set_theme.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/playlist_bloc/playlist_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/music/services/audio_handler.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! Features
  // bloc
  // music_bloc
  sl.registerLazySingleton(() => MusicBloc(
      getAllMusic: sl(),
      getArtist: sl(),
      getAlbums: sl(),
      getFolder: sl(),
      requestStoragePermission: sl()));

  // playlist_bloc
  sl.registerFactory(() => PlaylistBloc(
      requestStoragePermission: sl(),
      getMusicByArtist: sl(),
      getMusicByAlbum: sl(),
      getMusicByFolder: sl(),
      getAlbumArt: sl()));

  // settings_bloc
  sl.registerFactory(() => SettingsBloc(getTheme: sl(), setTheme: sl()));

  // search_bloc
  sl.registerFactory(() => SearchBloc(
      musicBloc: sl(), getSearchCategory: sl(), setSearchCategory: sl()));

  // player_bloc
  sl.registerFactory(() => PlayerBloc(sl()));

  // usecases

  // music usecases
  sl.registerLazySingleton(() => GetAlbums(sl()));
  sl.registerLazySingleton(() => GetAllMusic(sl()));
  sl.registerLazySingleton(() => GetArtists(sl()));
  sl.registerLazySingleton(() => GetFolders(sl()));
  sl.registerLazySingleton(() => RequestStoragePermission(sl()));

  // playlist usecases (under music umbrella)
  sl.registerLazySingleton(() => GetMusicByAlbum(sl()));
  sl.registerLazySingleton(() => GetMusicByArtist(sl()));
  sl.registerLazySingleton(() => GetMusicByFolder(sl()));
  sl.registerLazySingleton(() => GetAlbumArt(sl()));

  // settings usecases
  sl.registerLazySingleton(() => GetTheme(sl()));
  sl.registerLazySingleton(() => SetTheme(sl()));

  // search usecases
  sl.registerLazySingleton(() => GetSearchCategory(sl()));
  sl.registerLazySingleton(() => SetSearchCategory(sl()));

  // repositories

  // music repositories
  sl.registerLazySingleton<MusicRepository>(
      () => MusicRepositoryImpl(dataSource: sl(), storagePermissionInfo: sl()));

  // settings repositories
  sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(localDataSource: sl()));

  // search repositories
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(dataSource: sl()));

  // datasources
  // music datasources
  sl.registerLazySingleton<MusicLocalDataSource>(
      () => MusicLocalDataSourceImpl(audioRetriever: sl()));

  // settings datasources
  sl.registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl(sharedPreferences: sl()));

  // search datasources
  sl.registerLazySingleton<SearchDataSource>(
    () => SearchDataSourceImpl(sharedPreferences: sl()),
  );

  // ! Core
  sl.registerLazySingleton<StoragePermissionInfo>(
      () => StoragePermissionInfoImpl(permissionCaller: sl()));

  // ! External
  // an audioretriever for music datasource
  sl.registerLazySingleton(() => OnAudioQuery());

  // for storing settings values
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // sl.registerLazySingleton(() => SpeechToText());
  sl.registerLazySingleton(() => AndroidEqualizer());

  // ! Services
  sl.registerSingleton<AudioHandler>(await initAudioService());
}
