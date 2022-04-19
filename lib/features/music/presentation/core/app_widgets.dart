import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/core/theme/theme.dart';
import 'package:music_player/features/music/presentation/views/library/library.dart';
import 'package:music_player/service_locator.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MusicBloc>()..add(StartEvent()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: true,
          theme: lightTheme,
          home: const Library()),
    );
  }
}
