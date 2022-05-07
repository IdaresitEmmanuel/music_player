import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/player_bloc/player_bloc.dart';
import '../../../core/theme/dimensions.dart';

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
              onTap: () => context.read<PlayerBloc>().add(SetShuffleMode()),
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
              onTap: () => context.read<PlayerBloc>().add(SetRepeatMode()),
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
