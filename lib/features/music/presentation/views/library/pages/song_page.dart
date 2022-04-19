import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/colors.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/library/widgets/song_widget.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppDimentions.pageMargin, vertical: 10.0),
          child: Row(
            children: [
              Container(
                // height: 30.0,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.dividerColor),
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
              const SizedBox(width: 10.0),
              Container(
                // height: 30.0,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.dividerColor),
                    borderRadius: BorderRadius.circular(6.0)),
                child: Row(
                  children: [
                    Icon(
                      Icons.sort_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    const Text("Sort By")
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<MusicBloc, MusicState>(
            builder: (context, state) {
              if (state.isMusicLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              state.albumFailureOrSuccess.map((a) {
                if (a.isLeft()) {
                  debugPrint("there is a failure in retrieving all music");
                } else {
                  debugPrint("there is no failurein retrieving music");
                }
              });
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.musicList.length,
                itemBuilder: (context, index) {
                  final music = state.musicList[index];
                  return SongWidget(title: music.title, artist: music.artist);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
