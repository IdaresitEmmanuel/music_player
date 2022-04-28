import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/playlist_bloc/playlist_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/search_bloc/search_bloc.dart';
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
        BlocProvider(create: (_) => sl<PlaylistBloc>()),
        BlocProvider(create: (_) => sl<SearchBloc>()),
        BlocProvider(create: (_) => sl<PlayerBloc>())
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
