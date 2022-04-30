import 'dart:async';
import 'dart:typed_data';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/player/equalizer.dart';
import 'package:music_player/features/music/presentation/views/player/queue.dart';

class MaxiPlayer extends StatefulWidget {
  const MaxiPlayer({Key? key}) : super(key: key);

  @override
  State<MaxiPlayer> createState() => _MaxiPlayerState();
}

class _MaxiPlayerState extends State<MaxiPlayer> {
  late final StreamSubscription playerBlocStream;
  final ValueNotifier<int> thumbnailNotifier = ValueNotifier(0);

  @override
  void initState() {
    playerBlocStream = context.read<PlayerBloc>().stream.listen((state) {
      var music = state.queue[state.currentIndex];
      if (music.id != thumbnailNotifier.value) {
        thumbnailNotifier.value = music.id;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    playerBlocStream.cancel();
    thumbnailNotifier.dispose();
    super.dispose();
  }

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
                    margin: EdgeInsets.symmetric(
                        horizontal: AppDimentions.pageMargin),
                    constraints:
                        const BoxConstraints(maxWidth: 300.0, maxHeight: 300.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: ValueListenableBuilder(
                      valueListenable: thumbnailNotifier,
                      builder: (context, int albumId, child) {
                        return FutureBuilder(
                            future: getArtWork(albumId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.memory(
                                    snapshot.data as Uint8List,
                                    fit: BoxFit.cover,
                                    width: double.maxFinite,
                                    height: double.maxFinite,
                                  ),
                                );
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
                    return Container(
                      constraints: const BoxConstraints(maxHeight: 50.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: AppDimentions.pageMargin),
                      child: Column(
                        children: [
                          Expanded(
                            child: Marquee(
                                text: currentMusic.title,
                                pauseAfterRound: const Duration(seconds: 5),
                                blankSpace: 20.0,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(height: 5.0),
                          Text(currentMusic.artist ?? "<unknown>"),
                        ],
                      ),
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
          child: BlocBuilder<PlayerBloc, PlayerState>(
            builder: (context, state) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        getDurationString(
                            state.currentPositioin.inMilliseconds.toDouble()),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                        getDurationString(
                            state.songDuration.inMilliseconds.toDouble()),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                  ]);
            },
          ),
        ),
        BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            return Container(
              margin:
                  EdgeInsets.symmetric(horizontal: AppDimentions.pageMargin),
              child: SliderTheme(
                data: SliderThemeData(
                    trackShape: CustomTrackShape(), trackHeight: 0.5),
                child: Slider(
                  value: getMilliSeconds(state.currentPositioin) <=
                          getMilliSeconds(state.songDuration)
                      ? getMilliSeconds(state.currentPositioin)
                      : getMilliSeconds(state.songDuration),
                  min: getMilliSeconds(Duration.zero),
                  max: getMilliSeconds(state.songDuration),
                  onChanged: (value) {
                    if (state.queue.isNotEmpty) {
                      context.read<PlayerBloc>().add(Seek(
                          position: Duration(milliseconds: value.round())));
                    }
                  },
                ),
              ),
            );
          },
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
                  const Text('Music Queue',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            InkResponse(
                radius: 30.0,
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => const Dialog(
                        backgroundColor: Colors.transparent,
                        child: Equalizer())),
                child: const Icon(Icons.graphic_eq_rounded)),
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
            GestureDetector(
              onTap: () {
                if (state.shuffleMode == AudioServiceShuffleMode.none) {
                  context.read<PlayerBloc>().add(
                      SetShuffleMode(shuffleMode: AudioServiceShuffleMode.all));
                } else {
                  context.read<PlayerBloc>().add(SetShuffleMode(
                      shuffleMode: AudioServiceShuffleMode.none));
                }
              },
              child: Icon(
                Icons.shuffle_rounded,
                size: 30,
                color: state.shuffleMode == AudioServiceShuffleMode.all
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).iconTheme.color,
              ),
            ),
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
              child: const Icon(Icons.skip_next_rounded, size: 40.0),
            ),
            GestureDetector(
              onTap: () {
                switch (state.repeatMode) {
                  case AudioServiceRepeatMode.none:
                    {
                      context.read<PlayerBloc>().add(SetRepeatMode(
                          repeatMode: AudioServiceRepeatMode.all));
                    }
                    break;

                  case AudioServiceRepeatMode.all:
                    {
                      context.read<PlayerBloc>().add(SetRepeatMode(
                          repeatMode: AudioServiceRepeatMode.one));
                    }
                    break;

                  case AudioServiceRepeatMode.one:
                    {
                      context.read<PlayerBloc>().add(SetRepeatMode(
                          repeatMode: AudioServiceRepeatMode.none));
                    }
                    break;

                  case AudioServiceRepeatMode.group:
                    // Do nothing here
                    break;
                } // end switch
              },
              child: state.repeatMode == AudioServiceRepeatMode.one
                  ? Icon(Icons.repeat_one_rounded,
                      color: Theme.of(context).primaryColor, size: 30)
                  : Icon(
                      Icons.repeat_rounded,
                      color: state.repeatMode == AudioServiceRepeatMode.all
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).iconTheme.color,
                      size: 30,
                    ),
            )
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
