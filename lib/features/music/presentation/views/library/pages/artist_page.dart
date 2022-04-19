import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/views/library/widgets/artist_widget.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicBloc, MusicState>(
      builder: (context, state) {
        if (state.isMusicLoading) {
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
          itemCount: state.artistList.length,
          itemBuilder: (context, index) {
            final artist = state.artistList[index];
            return ArtistWidget(
                artist: artist.name, noOfSongs: artist.noOfSongs);
          },
        );
      },
    );
  }
}
