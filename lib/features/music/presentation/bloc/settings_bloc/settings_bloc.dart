import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/features/music/domain/usecases/settings_usecases/get_theme.dart';
import 'package:music_player/features/music/domain/usecases/settings_usecases/set_theme.dart';
import 'package:music_player/core/constants/enums.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  GetTheme getTheme;
  SetTheme setTheme;
  SettingsBloc({required this.getTheme, required this.setTheme})
      : super(SettingsState.initial()) {
    on<GetThemeEvent>((event, emit) async {
      final result = await getTheme();
      result.fold((l) => l, (r) => emit(state.copyWith(theme: r)));
    });

    on<SetThemeEvent>((event, emit) async {
      final result = await setTheme(event.theme);
      if (result.isRight()) {
        add(GetThemeEvent());
      }
    });
  }
}
