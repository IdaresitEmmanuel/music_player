part of 'music_bloc.dart';

@freezed
abstract class MusicState with _$MusicState {
  const factory MusicState({
    required bool isMusicLoading,
    required bool isArtistLoading,
    required bool isAlbumLoading,
    required bool isFolderLoading,
    required Option<Either<Failure, List<Music>>> musicFailureOrSuccess,
    required Option<Either<Failure, List<Artist>>> artistFailureOrSuccess,
    required Option<Either<Failure, List<Album>>> albumFailureOrSuccess,
    required Option<Either<Failure, List<Folder>>> folderFailureOrSuccess,
  }) = _MusicState;

  factory MusicState.initial() => MusicState(
      isMusicLoading: false,
      isArtistLoading: false,
      isAlbumLoading: false,
      isFolderLoading: false,
      musicFailureOrSuccess: none(),
      artistFailureOrSuccess: none(),
      albumFailureOrSuccess: none(),
      folderFailureOrSuccess: none());
}
