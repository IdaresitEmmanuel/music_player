import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/features/music/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:music_player/features/music/presentation/views/library/widgets/song_widget.dart';
import 'package:music_player/features/music/presentation/views/search/widgets/search_bar.dart';
import 'package:music_player/features/music/presentation/views/search/widgets/search_category_widget.dart';

import '../library/widgets/album_widget.dart';
import '../library/widgets/artist_widget.dart';
import '../library/widgets/folder_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<SearchBloc>().add(SetUp());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const AppSearchBar(),
          const SearchCategoryWidget(),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                switch (state.searchCategory) {
                  case SearchCategory.key:
                  case SearchCategory.songs:
                    return ListView.builder(
                        itemCount: state.musicList.length,
                        itemBuilder: (context, index) {
                          return SongWidget(
                            song: state.musicList[index],
                            showMenu: false,
                            index: 0,
                            songWidgetType: SongWidgetType.search,
                          );
                        });

                  case SearchCategory.aritst:
                    return ListView.builder(
                        itemCount: state.artistList.length,
                        itemBuilder: (context, index) {
                          final artist = state.artistList[index];
                          return ArtistWidget(
                              artist: artist.name,
                              noOfSongs: artist.noOfSongs,
                              showMenu: false);
                        });

                  case SearchCategory.album:
                    return ListView.builder(
                        itemCount: state.albumList.length,
                        itemBuilder: (context, index) {
                          return AlbumWidget(
                              album: state.albumList[index], showMenu: false);
                        });
                  case SearchCategory.folder:
                    return ListView.builder(
                        itemCount: state.folderList.length,
                        itemBuilder: (context, index) {
                          final folder = state.folderList[index];
                          return FolderWidget(
                            folder: folder.name,
                            noOfSongs: folder.noOfSongs,
                            showMenu: false,
                          );
                        });
                }
              },
            ),
          )
        ]),
      ),
    );
  }
}
