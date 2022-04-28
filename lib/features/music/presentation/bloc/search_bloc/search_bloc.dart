import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/entities/artist.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/usecases/search_usecases/get_search_category.dart';
import 'package:music_player/features/music/domain/usecases/search_usecases/set_search_category.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MusicBloc musicBloc;
  final GetSearchCategory getSearchCategory;
  final SetSearchCategory setSearchCategory;
  SearchBloc(
      {required this.musicBloc,
      required this.getSearchCategory,
      required this.setSearchCategory})
      : super(SearchState.initial()) {
    on<SetUp>((event, emit) {
      final musicState = musicBloc.state;
      emit(state.copyWith(
        musicList: musicState.musicList,
        artistList: musicState.artistList,
        albumList: musicState.albumList,
        folderList: musicState.folderList,
      ));
    });

    on<SetSearchCategoryEvent>((event, emit) async {
      setSearchCategory(event.category);
      emit(state.copyWith(searchCategory: event.category));
    });

    on<GetSearchCategoryEvent>((event, emit) async {
      final result = await getSearchCategory();
      emit(state.copyWith(searchCategory: result));
    });

    on<SearchAll>((event, emit) {
      final musicState = musicBloc.state;
      List<Music> musicList = [];
      List<Artist> artistList = [];
      List<Album> albumList = [];
      List<Folder> folderList = [];

      for (var music in musicState.musicList) {
        if (music.title.toLowerCase().contains(event.query.toLowerCase())) {
          musicList.add(music);
        }
      }

      for (var artist in musicState.artistList) {
        if (artist.name.toLowerCase().contains(event.query.toLowerCase())) {
          artistList.add(artist);
        }
      }

      for (var album in musicState.albumList) {
        if (album.name.toLowerCase().contains(event.query.toLowerCase())) {
          albumList.add(album);
        }
      }

      for (var folder in musicState.folderList) {
        if (folder.name.toLowerCase().contains(event.query.toLowerCase())) {
          folderList.add(folder);
        }
      }

      emit(state.copyWith(
          musicList: musicList,
          artistList: artistList,
          albumList: albumList,
          folderList: folderList));
    });
  }
}
