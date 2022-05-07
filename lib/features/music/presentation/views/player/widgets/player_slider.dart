import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/service_locator.dart';

import '../../../../../../core/utilities/helper_functions.dart';
import '../../../bloc/player_bloc/player_bloc.dart';
import '../../../bloc/player_position_cubit/player_position_cubit.dart';
import '../../../core/theme/dimensions.dart';

class PlayerSlider extends StatefulWidget {
  const PlayerSlider({Key? key}) : super(key: key);

  @override
  State<PlayerSlider> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends State<PlayerSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerPositionCubit, PlayerPositionState>(
      bloc: sl<PlayerPositionCubit>(),
      builder: (context, pState) {
        var totalDuration = context.read<PlayerBloc>().state.songDuration;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimentions.pageMargin),
          child: SliderTheme(
            data: SliderThemeData(
                trackShape: CustomTrackShape(), trackHeight: 0.5),
            child: Slider(
              value: getMilliSeconds(pState.position) <=
                      getMilliSeconds(totalDuration)
                  ? getMilliSeconds(pState.position)
                  : getMilliSeconds(totalDuration),
              min: getMilliSeconds(Duration.zero),
              max: getMilliSeconds(totalDuration),
              onChanged: (value) {
                context
                    .read<PlayerBloc>()
                    .add(Seek(position: Duration(milliseconds: value.round())));
              },
            ),
          ),
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
