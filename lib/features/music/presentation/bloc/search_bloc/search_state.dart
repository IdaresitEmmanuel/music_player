part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<Music> musicList,
    required List<Artist> artistList,
    required List<Album> albumList,
    required List<Folder> folderList,
    required SearchCategory searchCategory,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
      musicList: [],
      artistList: [],
      albumList: [],
      folderList: [],
      searchCategory: SearchCategory.songs);
}
