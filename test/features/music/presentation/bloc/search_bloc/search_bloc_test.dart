import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/core/constants/enums.dart';

import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:music_player/features/music/domain/usecases/search_usecases/get_search_category.dart';
import 'package:music_player/features/music/domain/usecases/search_usecases/set_search_category.dart';

import 'search_bloc_test.mocks.dart';

@GenerateMocks([MusicBloc, GetSearchCategory, SetSearchCategory])
void main() {
  MockSetSearchCategory mockSetSearchCategory = MockSetSearchCategory();
  MockGetSearchCategory mockGetSearchCategory = MockGetSearchCategory();
  MockMusicBloc mockMusicBloc = MockMusicBloc();
  SearchBloc searchBloc = SearchBloc(
      musicBloc: mockMusicBloc,
      setSearchCategory: mockSetSearchCategory,
      getSearchCategory: mockGetSearchCategory);
  final musicList = [
    const Music(id: 1, title: "title", path: "path", data: "data", size: 1)
  ];
  final artistList = [const Artist(name: "artist", noOfSongs: "5 songs")];
  final albumList = [const Album(id: 1, name: "name", noOfSongs: "3 songs")];
  final folderList = [const Folder(name: "name", noOfSongs: "4 songs")];

  test('test to verify initial state', () async {
    expect(searchBloc.state, SearchState.initial());
  });

  blocTest(
    "test for setup event",
    build: () {
      when(mockMusicBloc.state).thenReturn(MusicState.initial().copyWith(
          musicList: musicList,
          artistList: artistList,
          albumList: albumList,
          folderList: folderList));
      return SearchBloc(
          musicBloc: mockMusicBloc,
          setSearchCategory: mockSetSearchCategory,
          getSearchCategory: mockGetSearchCategory);
    },
    act: (SearchBloc searchBloc) {
      searchBloc.add(SetUp());
    },
    expect: () => [
      SearchState.initial().copyWith(
          musicList: musicList,
          artistList: artistList,
          albumList: albumList,
          folderList: folderList)
    ],
  );

  blocTest(
    "test for SearchAll Event",
    build: () {
      when(mockMusicBloc.state).thenReturn(MusicState.initial().copyWith(
          musicList: musicList,
          artistList: artistList,
          albumList: albumList,
          folderList: folderList));
      return SearchBloc(
          musicBloc: mockMusicBloc,
          setSearchCategory: mockSetSearchCategory,
          getSearchCategory: mockGetSearchCategory);
    },
    act: (SearchBloc searchBloc) {
      searchBloc.add(SearchAll(""));
    },
    expect: () => [
      SearchState.initial().copyWith(
          musicList: musicList,
          artistList: artistList,
          albumList: albumList,
          folderList: folderList)
    ],
  );

  blocTest("SetSearchCategory event tests",
      build: () {
        when(mockSetSearchCategory(SearchCategory.album))
            .thenAnswer((_) async => const Right(unit));
        return SearchBloc(
            musicBloc: mockMusicBloc,
            setSearchCategory: mockSetSearchCategory,
            getSearchCategory: mockGetSearchCategory);
      },
      act: (SearchBloc searchBloc) {
        searchBloc.add(SetSearchCategoryEvent(SearchCategory.album));
      },
      expect: () => [
            SearchState.initial().copyWith(searchCategory: SearchCategory.album)
          ],
      verify: (SearchBloc searchBloc) {
        verify(mockSetSearchCategory(SearchCategory.album));
      });

  blocTest("GetSearchCategory event tests",
      build: () {
        when(mockGetSearchCategory())
            .thenAnswer((_) async => SearchCategory.album);
        return SearchBloc(
            musicBloc: mockMusicBloc,
            setSearchCategory: mockSetSearchCategory,
            getSearchCategory: mockGetSearchCategory);
      },
      act: (SearchBloc searchBloc) {
        searchBloc.add(GetSearchCategoryEvent());
      },
      expect: () => [
            SearchState.initial().copyWith(searchCategory: SearchCategory.album)
          ],
      verify: (SearchBloc searchBloc) {
        verify(mockGetSearchCategory());
      });
}
