import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_position_state.dart';
part 'player_position_cubit.freezed.dart';

class PlayerPositionCubit extends Cubit<PlayerPositionState> {
  late final StreamSubscription positionStreamSubscription;

  @override
  Future<void> close() async {
    positionStreamSubscription.cancel();
    super.close();
  }

  PlayerPositionCubit() : super(PlayerPositionState.initial()) {
    positionStreamSubscription = AudioService.position.listen((position) {
      emit(state.copyWith(position: position));
    });
  }
}
