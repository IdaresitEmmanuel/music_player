import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/presentation/bloc/playlist_bloc/playlist_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/library/widgets/song_widget.dart';
import 'package:music_player/features/music/presentation/views/player/mini_player.dart';

import '../../core/theme/colors.dart';

class Playlist extends StatefulWidget {
  const Playlist(
      {Key? key, required this.playlistType, required this.playlistName})
      : super(key: key);

  final PlaylistType playlistType;
  final String playlistName;

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  void initState() {
    context.read<PlaylistBloc>().add(
        GetPlaylistEvent(type: widget.playlistType, name: widget.playlistName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CustomScrollView(slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              toolbarHeight: 100.0,
              pinned: true,
              snap: false,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              leading: InkResponse(
                radius: 24,
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: BlocBuilder<PlaylistBloc, PlaylistState>(
                builder: (playlistContext, state) {
                  return Stack(
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        color: Colors.black.withOpacity(.4),
                        child: Builder(builder: (context) {
                          Widget tempWidget = Container();
                          if (state.image.isSome()) {
                            state.image.map((a) {
                              tempWidget = Image.memory(a)
                                  .blurred(blur: 20, blurColor: Colors.black);
                            });
                          }
                          return tempWidget;
                        }),
                      ),
                      FlexibleSpaceBar(
                        background: Container(
                          height: 220.0,
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimentions.pageMargin),
                          child: Row(children: [
                            SizedBox(
                              height: 80.0,
                              width: 80.0,
                              child: AlbumThumbnail(
                                  playlistType: widget.playlistType),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                    child: Marquee(
                                        pauseAfterRound:
                                            const Duration(seconds: 5),
                                        blankSpace: 20.0,
                                        text: widget.playlistName,
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                      playListNoToString(
                                          state.musicList.length),
                                      style:
                                          const TextStyle(color: Colors.white),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    ],
                  );
                },
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimentions.pageMargin, vertical: 10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Icon(Icons.play_arrow_rounded,
                            color: Colors.white),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.dividerColorDark),
                            borderRadius: BorderRadius.circular(6.0)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shuffle_rounded,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            const Text("Shuffle all")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<PlaylistBloc, PlaylistState>(
              builder: (playlistContext, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final music = state.musicList[index];
                      return Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: SongWidget(
                            song: music,
                            index: index,
                            songWidgetType: SongWidgetType.playlist,
                          ));
                    },
                    childCount: state.musicList.length,
                  ),
                );
              },
            )
          ]),
        ),
        const MiniPlayer()
      ]),
    );
  }
}

class AlbumThumbnail extends StatelessWidget {
  const AlbumThumbnail({Key? key, required this.playlistType})
      : super(key: key);
  final PlaylistType playlistType;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(builder: (context, state) {
      Widget tempWidget = Container();
      if (state.image.isSome()) {
        state.image.map((a) {
          tempWidget = ClipRRect(
            child: Image.memory(a),
            borderRadius: BorderRadius.circular(6.0),
          );
        });
      } else {
        switch (playlistType) {
          case PlaylistType.artist:
            tempWidget =
                const Icon(Icons.person, size: 80, color: Colors.white);
            break;
          case PlaylistType.album:
            tempWidget = const Icon(Icons.album, size: 80, color: Colors.white);
            break;
          case PlaylistType.folder:
            tempWidget =
                const Icon(Icons.folder, size: 80, color: Colors.white);
            break;
        }
      }
      return tempWidget;
    });
  }
}
