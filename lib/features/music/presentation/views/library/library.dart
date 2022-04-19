import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';
import 'package:music_player/features/music/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/library/pages/album_page.dart';
import 'package:music_player/features/music/presentation/views/library/pages/artist_page.dart';
import 'package:music_player/features/music/presentation/views/library/pages/folder_page.dart';
import 'package:music_player/features/music/presentation/views/library/pages/song_page.dart';
import 'package:preload_page_view/preload_page_view.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> with TickerProviderStateMixin {
  late final TabController _tabController;
  final _pageController = PreloadPageController();

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppDimentions.pageMargin, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return GestureDetector(
                      onTap: () {
                        if (state.theme == ThemeSetting.dark) {
                          context
                              .read<SettingsBloc>()
                              .add(SetThemeEvent(theme: ThemeSetting.light));
                        } else {
                          context
                              .read<SettingsBloc>()
                              .add(SetThemeEvent(theme: ThemeSetting.dark));
                        }
                      },
                      child: const Icon(Icons.menu));
                },
              ),
              const Icon(Icons.search)
            ],
          ),
        ),
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.transparent,
          labelStyle: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Theme.of(context).iconTheme.color,
          unselectedLabelStyle:
              TextStyle(fontSize: AppDimentions.bodyTextMedium),
          controller: _tabController,
          onTap: (page) {
            _pageController.animateToPage(page,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          },
          tabs: const [
            Tab(text: "All Songs"),
            Tab(text: "Artist"),
            Tab(text: "Albums"),
            Tab(text: "Folders"),
          ],
        ),
        Expanded(
          child: PreloadPageView(
            preloadPagesCount: 4,
            controller: _pageController,
            onPageChanged: (page) {
              _tabController.animateTo(page);
            },
            children: const [
              SongPage(),
              ArtistPage(),
              AlbumPage(),
              FolderPage()
            ],
          ),
        )
      ],
    )));
  }
}
