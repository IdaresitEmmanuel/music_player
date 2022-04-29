import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/player/maxi_player.dart';

import '../../../../../core/utilities/helper_functions.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({Key? key}) : super(key: key);

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  late final StreamSubscription playerBlocStream;
  final ValueNotifier<int?> thumbnailNotifier = ValueNotifier(null);
  final ValueNotifier<bool> visibleNotifier = ValueNotifier(false);

  @override
  void initState() {
    playerBlocStream = context.read<PlayerBloc>().stream.listen((state) {
      if (state.queue.isNotEmpty) {
        var music = state.queue[state.currentIndex];
        if (music.albumId != thumbnailNotifier.value) {
          thumbnailNotifier.value = music.albumId;
        }
      }
      visibleNotifier.value = state.queue.isNotEmpty;
    });
    super.initState();
  }

  @override
  void dispose() {
    visibleNotifier.dispose();
    thumbnailNotifier.dispose();
    playerBlocStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: visibleNotifier,
      builder: (context, bool visible, child) {
        return !visible
            ? const SizedBox.shrink()
            : GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const MaxiPlayer())),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDimentions.pageMargin),
                  height: 60.0,
                  width: double.maxFinite,
                  color: Theme.of(context).cardColor,
                  child: Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: thumbnailNotifier,
                        builder: (context, int? albumId, child) {
                          // final song = state.queue[state.currentIndex];
                          return FutureBuilder(
                              future: albumId != null
                                  ? getArtWork(albumId)
                                  : Future.value(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: ClipOval(
                                      child: Image.memory(
                                          snapshot.data as Uint8List,
                                          fit: BoxFit.cover),
                                    ),
                                  );
                                }

                                return Icon(Icons.music_note,
                                    color: Theme.of(context).iconTheme.color);
                              });
                        },
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(child: BlocBuilder<PlayerBloc, PlayerState>(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(currentMusic.title,
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                              Text(currentMusic.artist ?? "<unknown>",
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          );
                        },
                      )),
                      const MiniControls(),
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class MiniControls extends StatelessWidget {
  const MiniControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => context.read<PlayerBloc>().add(SkipPrevious()),
            child: const Icon(Icons.skip_previous_rounded, size: 30)),
        BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<PlayerBloc>()
                  .add(state.isPlaying ? Pause() : Play()),
              child: Icon(
                  state.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  size: 40),
            );
          },
        ),
        GestureDetector(
            onTap: () => context.read<PlayerBloc>().add(SkipNext()),
            child: const Icon(Icons.skip_next_rounded, size: 30)),
        const SizedBox(width: 10.0),
        GestureDetector(
            onTap: () => context.read<PlayerBloc>().add(Stop()),
            child: const Icon(Icons.close_rounded)),
      ],
    );
  }
}
