import 'package:flutter/material.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';

import '../../playlist/playlist.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget(
      {Key? key,
      required this.folder,
      required this.noOfSongs,
      this.showMenu = true})
      : super(key: key);
  final String folder;
  final String noOfSongs;
  final bool showMenu;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => Playlist(
                playlistName: folder,
                playlistType: PlaylistType.folder,
              ))),
      leading: Icon(
        Icons.folder_rounded,
        color: Theme.of(context).cardColor,
        size: 64,
      ),
      title: Text(folder),
      subtitle: Text(noOfSongs),
      trailing: showMenu
          ? const Icon(Icons.more_vert_rounded)
          : const SizedBox.shrink(),
    );
  }
}
