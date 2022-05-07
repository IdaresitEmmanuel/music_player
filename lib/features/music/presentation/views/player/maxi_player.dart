import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';
import 'package:music_player/features/music/presentation/views/player/widgets/maxi_controls.dart';

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
                    margin: EdgeInsets.symmetric(
                        horizontal: AppDimentions.pageMargin),
                    constraints:
                        const BoxConstraints(maxWidth: 300.0, maxHeight: 300.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: BlocBuilder<PlayerBloc, PlayerState>(
                      builder: (bc, state) {
                        if (state.musicArt.isSome()) {
                          var musicArt =
                              state.musicArt.getOrElse(() => Uint8List(0));

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.memory(
                              musicArt,
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
