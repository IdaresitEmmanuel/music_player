import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_albums.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_all_music.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_folders.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_artists.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/request_storage_permission.dart';

part 'music_event.dart';
part 'music_state.dart';
part 'music_bloc.freezed.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final GetAllMusic getAllMusic;
  final GetArtists getArtist;
  final GetAlbums getAlbums;
  final GetFolders getFolder;
  final RequestStoragePermission requestStoragePermission;

  MusicBloc(
      {required this.getAllMusic,
      required this.getArtist,
      required this.getAlbums,
      required this.getFolder,
      required this.requestStoragePermission})
      : super(MusicState.initial()) {
    on<StartEvent>((event, emit) async {
      if (await requestStoragePermission()) {
        log("Permission has been granted");
        add(GetMusicEvent());
        add(GetAlbumEvent());
        add(GetArtistEvent());
        add(GetFolderEvent());
      } else {
        log("no permission given yet");
      }
    });

    on<GetMusicEvent>((event, emit) async {
      emit(state.copyWith(isMusicLoading: true));
      final result = await getAllMusic();
      result.fold(
        (l) => emit(state.copyWith(
            isMusicLoading: false, musicFailureOrSuccess: some(left(l)))),
        (r) => emit(state.copyWith(
            isMusicLoading: false,
            musicList: r,
            musicFailureOrSuccess: some(right(unit)))),
      );
    });

    on<GetArtistEvent>((event, emit) async {
      emit(state.copyWith(isArtistLoading: true));
      final result = await getArtist();
      result.fold(
        (l) => emit(state.copyWith(
            isArtistLoading: false, artistFailureOrSuccess: some(left(l)))),
        (r) => emit(state.copyWith(
            isArtistLoading: false,
            artistList: r,
            artistFailureOrSuccess: some(right(unit)))),
      );
    });

    on<GetAlbumEvent>((event, emit) async {
      emit(state.copyWith(isAlbumLoading: true));
      final result = await getAlbums();
      result.fold(
        (l) => emit(state.copyWith(
            isAlbumLoading: false, albumFailureOrSuccess: some(left(l)))),
        (r) => emit(state.copyWith(
            isAlbumLoading: false,
            albumList: r,
            albumFailureOrSuccess: some(right(unit)))),
      );
    });

    on<GetFolderEvent>((event, emit) async {
      emit(state.copyWith(isFolderLoading: true));
      final result = await getFolder();
      result.fold(
          (l) => emit(state.copyWith(
              isFolderLoading: false, folderFailureOrSuccess: some(left(l)))),
          (r) => emit(state.copyWith(
              isFolderLoading: false,
              folderList: r,
              folderFailureOrSuccess: some(right(unit)))));
    });

    on<RequestStoragePermissionEvent>((event, emit) async {
      final result = await requestStoragePermission();
      log("storage permission status: $result");
    });
  }
}
