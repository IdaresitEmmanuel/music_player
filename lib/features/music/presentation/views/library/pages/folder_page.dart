import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/views/library/widgets/folder_widget.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({Key? key}) : super(key: key);

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
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
          itemCount: state.folderList.length,
          itemBuilder: (context, index) {
            final folder = state.folderList[index];
            return FolderWidget(
                folder: folder.name, noOfSongs: folder.noOfSongs.toString());
          },
        );
      },
    );
  }
}
