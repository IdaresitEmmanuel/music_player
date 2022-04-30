import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_album_art.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_album.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_artist.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/get_music_by_folder.dart';
import 'package:music_player/features/music/domain/usecases/music_usecases/request_storage_permission.dart';
import 'package:music_player/core/constants/enums.dart';

import '../../../../../core/error/failures.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';
part 'playlist_bloc.freezed.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final RequestStoragePermission requestStoragePermission;
  final GetMusicByArtist getMusicByArtist;
  final GetMusicByAlbum getMusicByAlbum;
  final GetMusicByFolder getMusicByFolder;
  final GetAlbumArt getAlbumArt;
  PlaylistBloc(
      {required this.requestStoragePermission,
      required this.getMusicByArtist,
      required this.getMusicByAlbum,
      required this.getMusicByFolder,
      required this.getAlbumArt})
      : super(PlaylistState.initial()) {
    on<GetPlaylistEvent>((event, emit) async {
      emit(PlaylistState.initial());
      if (await requestStoragePermission()) {
        Either<Failure, List<Music>> result = const Right([]);

        switch (event.type) {
          case PlaylistType.artist:
            result = await getMusicByArtist(event.name);
            break;
          case PlaylistType.album:
            result = await getMusicByAlbum(event.name);
            break;
          case PlaylistType.folder:
            result = await getMusicByFolder(event.name);
            break;
        }

        result.fold((l) => l, (r) {
          emit(state.copyWith(musicList: r));
          if (event.type == PlaylistType.album) {
            if (r.isNotEmpty) {
              add(GetPlaylistThumbnailEvent(r.first.albumId!));
            }
          }
        });
      }
    });

    on<GetPlaylistThumbnailEvent>((event, emit) async {
      var result = await getAlbumArt(event.id);
      if (state.musicList.isNotEmpty && result == null) {
        result = await getArtWork(state.musicList[0].id);
      }
      if (result != null) {
        emit(state.copyWith(image: some(result)));
      }
    });
  }
}
