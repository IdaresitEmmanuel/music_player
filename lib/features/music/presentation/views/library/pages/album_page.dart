import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/views/library/widgets/album_widget.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(
      builder: (context, state) {
        if (state.isAlbumLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        state.albumFailureOrSuccess.map((a) {
          if (a.isLeft()) {
            debugPrint("there is a failure in retrieving all music");
          } else {
            debugPrint("there is no failurein retrieving music");
          }
        });
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.albumList.length,
          itemBuilder: (context, index) {
            final album = state.albumList[index];
            return AlbumWidget(album: album);
          },
        );
      },
    );
  }
}
