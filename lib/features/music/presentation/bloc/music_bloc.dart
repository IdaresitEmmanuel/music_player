import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/usecases/get_albums.dart';
import 'package:music_player/features/music/domain/usecases/get_all_music.dart';
import 'package:music_player/features/music/domain/usecases/get_folders.dart';
import 'package:music_player/features/music/domain/usecases/get_artists.dart';

part 'music_event.dart';
part 'music_state.dart';
part 'music_bloc.freezed.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  final GetAllMusic getAllMusic;
  final GetArtists getArtist;
  final GetAlbums getAlbums;
  final GetFolders getFolder;

  MusicBloc(
      {required this.getAllMusic,
      required this.getArtist,
      required this.getAlbums,
      required this.getFolder})
      : super(MusicState.initial()) {
    on<GetMusicEvent>((event, emit) async {
      emit(state.copyWith(isMusicLoading: true));
      final result = await getAllMusic();
      result.fold(
        (l) => emit(state.copyWith(
            isMusicLoading: false, musicFailureOrSuccess: some(left(l)))),
        (r) => emit(state.copyWith(
            isMusicLoading: false, musicFailureOrSuccess: some(right(r)))),
      );
    });

    on<GetArtistEvent>((event, emit) async {
      emit(state.copyWith(isArtistLoading: true));
      final result = await getArtist();
      result.fold(
        (l) => emit(state.copyWith(
            isArtistLoading: false, artistFailureOrSuccess: some(left(l)))),
        (r) => emit(state.copyWith(
            isArtistLoading: false, artistFailureOrSuccess: some(right(r)))),
      );
    });

    on<GetAlbumEvent>((event, emit) async {
      emit(state.copyWith(isAlbumLoading: true));
      final result = await getAlbums();
      result.fold(
        (l) => emit(state.copyWith(
            isAlbumLoading: false, albumFailureOrSuccess: some(left(l)))),
        (r) => emit(state.copyWith(
            isAlbumLoading: false, albumFailureOrSuccess: some(right(r)))),
      );
    });

    on<GetFolderEvent>((event, emit) async {
      emit(state.copyWith(isFolderLoading: true));
      final result = await getFolder();
      result.fold(
          (l) => emit(state.copyWith(
              isFolderLoading: false, folderFailureOrSuccess: some(left(l)))),
          (r) => emit(state.copyWith(
              isFolderLoading: false, folderFailureOrSuccess: some(right(r)))));
    });
  }
}
