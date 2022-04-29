import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'equalizer_event.dart';
part 'equalizer_state.dart';
part 'equalizer_bloc.freezed.dart';

class EqualizerBloc extends Bloc<EqualizerEvent, EqualizerState> {
  AndroidEqualizer _equalizer;
  EqualizerBloc(this._equalizer) : super(EqualizerState.initial()) {
    on<EqualizerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
