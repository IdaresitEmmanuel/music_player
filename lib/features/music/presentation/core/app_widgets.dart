import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/theme.dart';
import 'package:music_player/features/music/presentation/views/library/library.dart';
import 'package:music_player/service_locator.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MusicBloc>()..add(StartEvent())),
        BlocProvider(create: (_) => sl<SettingsBloc>()..add(GetThemeEvent())),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final themeMode = state.theme == ThemeSetting.dark
              ? ThemeMode.dark
              : ThemeMode.light;
          return MaterialApp(
              debugShowCheckedModeBanner: true,
              themeMode: themeMode,
              theme: lightTheme,
              darkTheme: darkTheme,
              home: const Library());
        },
      ),
    );
  }
}
