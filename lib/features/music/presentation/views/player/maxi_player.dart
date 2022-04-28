import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/player/queue.dart';

class MaxiPlayer extends StatefulWidget {
  const MaxiPlayer({Key? key}) : super(key: key);

  @override
  State<MaxiPlayer> createState() => _MaxiPlayerState();
}

class _MaxiPlayerState extends State<MaxiPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppDimentions.pageMargin, vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close_rounded)),
                    const Icon(Icons.more_vert_rounded),
                  ]),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 300.0, maxHeight: 300.0),
                    color: Theme.of(context).cardColor,
                    child: BlocBuilder<PlayerBloc, PlayerState>(
                      builder: (context, state) {
                        final song = state.queue[state.currentIndex];
                        return FutureBuilder(
                            future: song.albumId != null
                                ? getArtWork(song.albumId!)
                                : Future.value(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Image.memory(snapshot.data as Uint8List,
                                    fit: BoxFit.cover);
                              }

                              return SizedBox(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: Icon(Icons.headphones_rounded,
                                    size: 100.0,
                                    color: Theme.of(context).iconTheme.color),
                              );
                            });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                BlocBuilder<PlayerBloc, PlayerState>(
                  builder: (context, state) {
                    final currentMusic = state.queue.isNotEmpty
                        ? state.queue[state.currentIndex]
                        : const Music(
                            id: 1,
                            title: "<unkown>",
                            path: "path",
                            data: "data",
                            size: 3);
                    return Column(
                      children: [
                        Text(currentMusic.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18.0)),
                        const SizedBox(height: 4.0),
                        Text(currentMusic.artist ?? "<unknown>"),
                      ],
                    );
                  },
                )
              ],
            )),
            const Controlls()
          ],
        ),
      ),
    );
  }
}

class Controlls extends StatelessWidget {
  const Controlls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.0,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimentions.pageMargin),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("00:14"),
                Text("03:12"),
              ]),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimentions.pageMargin),
          child: SliderTheme(
            data: SliderThemeData(
                trackShape: CustomTrackShape(), trackHeight: 0.5),
            child: Slider(
              value: 4,
              min: 0,
              max: 8,
              // value: getMilliSeconds(progress.current) <=
              //         getMilliSeconds(progress.total)
              //     ? getMilliSeconds(progress.current)
              //     : getMilliSeconds(progress.total),
              // min: getMilliSeconds(Duration.zero),
              // max: getMilliSeconds(progress.total),
              onChanged: (value) {
                // if (pageManager
                //     .playlistNotifier.value.isNotEmpty) {
                //   pageManager.seek(Duration(
                //       milliseconds: value.round()));
                // }
              },
            ),
          ),
        ),
        const MediaButtons(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimentions.pageMargin),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Icon(Icons.favorite_rounded, color: Colors.red),
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Queue())),
              child: Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  const Text('Music Queue'),
                ],
              ),
            ),
            const Icon(Icons.graphic_eq_rounded),
          ]),
        )
      ]),
    );
  }
}

class MediaButtons extends StatelessWidget {
  const MediaButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimentions.pageMargin),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            const Icon(Icons.shuffle_rounded, size: 30),
            GestureDetector(
                onTap: () => context.read<PlayerBloc>().add(SkipPrevious()),
                child: const Icon(Icons.skip_previous_rounded, size: 40)),
            GestureDetector(
              onTap: () => context
                  .read<PlayerBloc>()
                  .add(state.isPlaying ? Pause() : Play()),
              child: Icon(
                  state.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  size: 80.0),
            ),
            GestureDetector(
                onTap: () => context.read<PlayerBloc>().add(SkipNext()),
                child: const Icon(Icons.skip_next_rounded, size: 40.0)),
            const Icon(Icons.shuffle_rounded, size: 30)
          ]),
        );
      },
    );
  }
}

// contains the shape of the player slider information
class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
