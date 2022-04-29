import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/features/music/presentation/core/theme/dimensions.dart';

import '../../../../../service_locator.dart';

class Equalizer extends StatefulWidget {
  const Equalizer({Key? key}) : super(key: key);

  @override
  State<Equalizer> createState() => _EqualizerState();
}

class _EqualizerState extends State<Equalizer> {
  final equalizer = sl<AndroidEqualizer>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: AppDimentions.pageMargin, vertical: 10.0),
      width: double.maxFinite,
      height: 400.0,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Equalizer",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  StreamBuilder<bool>(
                      stream: equalizer.enabledStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Switch(
                              value: snapshot.data!,
                              onChanged: (value) =>
                                  equalizer.setEnabled(value));
                        }
                        return const SizedBox.shrink();
                      })
                ]),
          ),
          Expanded(
            child: FutureBuilder<AndroidEqualizerParameters>(
              future: equalizer.parameters,
              builder: (context, snapshot) {
                final parameters = snapshot.data;
                if (parameters == null) return const SizedBox();
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for (var band in parameters.bands)
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: StreamBuilder<double>(
                                stream: band.gainStream,
                                builder: (context, snapshot) {
                                  return VerticalSlider(
                                    min: parameters.minDecibels,
                                    max: parameters.maxDecibels,
                                    value: band.gain,
                                    onChanged: band.setGain,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text('${band.centerFrequency.round()} Hz',
                                style: const TextStyle(fontSize: 10.0)),
                            // const Spacer(),
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Sound Boost"),
              SliderTheme(
                  data: SliderThemeData(
                      trackShape: CustomTrackShape(), trackHeight: 0.5),
                  child:
                      Slider(min: 0, max: 6, value: 3, onChanged: (value) {}))
            ]),
          )
        ],
      ),
    );
  }
}

class VerticalSlider extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double>? onChanged;

  const VerticalSlider({
    Key? key,
    required this.value,
    this.min = 0.0,
    this.max = 1.0,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      alignment: Alignment.bottomCenter,
      child: Transform.rotate(
        angle: -pi / 2,
        child: Container(
          width: 400.0,
          height: 400.0,
          alignment: Alignment.center,
          child: SliderTheme(
            data: SliderThemeData(
                trackShape: CustomTrackShape(), trackHeight: 0.5),
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
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
