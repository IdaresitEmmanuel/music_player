part of 'music_bloc.dart';

@freezed
abstract class MusicState with _$MusicState {
  const factory MusicState({
    required bool isMusicLoading,
    required bool isArtistLoading,
    required bool isAlbumLoading,
    required bool isFolderLoading,
    required List<Music> musicList,
    required List<Artist> artistList,
    required List<Album> albumList,
    required List<Folder> folderList,
    required Option<Either<Failure, Unit>> musicFailureOrSuccess,
    required Option<Either<Failure, Unit>> artistFailureOrSuccess,
    required Option<Either<Failure, Unit>> albumFailureOrSuccess,
    required Option<Either<Failure, Unit>> folderFailureOrSuccess,
  }) = _MusicState;

  factory MusicState.initial() => MusicState(
      isMusicLoading: false,
      isArtistLoading: false,
      isAlbumLoading: false,
      isFolderLoading: false,
      musicFailureOrSuccess: none(),
      artistFailureOrSuccess: none(),
      albumFailureOrSuccess: none(),
      folderFailureOrSuccess: none(),
      albumList: [],
      artistList: [],
      folderList: [],
      musicList: []);
}
