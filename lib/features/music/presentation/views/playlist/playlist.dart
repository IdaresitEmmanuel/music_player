import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/library/widgets/song_widget.dart';

import '../../core/theme/colors.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key? key}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            toolbarHeight: 100.0,
            pinned: true,
            snap: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            flexibleSpace: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.deepOrange,
                ),
                FlexibleSpaceBar(
                  background: Container(
                    height: 220.0,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimentions.pageMargin),
                    child: Row(children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 20.0),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Album text",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          Text("15 Songs",
                              style: TextStyle(color: Colors.white)),
                          Text("1:30:25",
                              style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ]),
                  ),
                ),
              ],
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
                          border: Border.all(color: AppColors.dividerColorDark),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final music = context.read<MusicBloc>().state.musicList[index];
                return Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: SongWidget(song: music));
              },
              childCount: context.read<MusicBloc>().state.musicList.length,
            ),
          )
        ])
      ]),
    );
  }
}
