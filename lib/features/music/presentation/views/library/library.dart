import 'package:flutter/material.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/drawer/drawer.dart';
import 'package:music_player/features/music/presentation/views/library/pages/album_page.dart';
import 'package:music_player/features/music/presentation/views/library/pages/artist_page.dart';
import 'package:music_player/features/music/presentation/views/library/pages/folder_page.dart';
import 'package:music_player/features/music/presentation/views/library/pages/song_page.dart';
import 'package:music_player/features/music/presentation/views/player/mini_player.dart';
import 'package:music_player/features/music/presentation/views/search/search_page.dart';
import 'package:preload_page_view/preload_page_view.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> with TickerProviderStateMixin {
  late final TabController _tabController;
  final _pageController = PreloadPageController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawer(),
        drawerEnableOpenDragGesture: true,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppDimentions.pageMargin, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => scaffoldKey.currentState!.openDrawer(),
                      child: const Icon(Icons.menu)),
                  InkResponse(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const SearchPage())),
                      radius: 24,
                      child:
                          const Hero(tag: "search", child: Icon(Icons.search)))
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
            ),
            const MiniPlayer(),
          ],
        )));
  }
}
