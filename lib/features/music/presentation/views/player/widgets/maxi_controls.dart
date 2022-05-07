
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/player_position_cubit/player_position_cubit.dart';
import 'package:music_player/features/music/presentation/views/player/widgets/player_slider.dart';

import '../../../../../../core/utilities/helper_functions.dart';
import '../../../../../../service_locator.dart';
import '../../../bloc/player_bloc/player_bloc.dart';
import '../../../core/theme/dimensions.dart';
import '../equalizer.dart';
import '../queue.dart';
import 'maxi_media_buttons.dart';

class Controlls extends StatelessWidget {
  const Controlls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.0,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimentions.pageMargin),
          child: BlocBuilder<PlayerPositionCubit, PlayerPositionState>(
            bloc: sl<PlayerPositionCubit>(),
            builder: (context, pState) {
              var totalDuration = context.read<PlayerBloc>().state.songDuration;
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        getDurationString(
                            pState.position.inMilliseconds.toDouble()),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    Text(
                        getDurationString(
                            totalDuration.inMilliseconds.toDouble()),
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                  ]);
            },
          ),
        ),
        const PlayerSlider(),
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