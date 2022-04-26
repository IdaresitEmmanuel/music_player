import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';
import 'package:music_player/features/music/domain/utilities/helper_functions.dart';
import 'package:music_player/features/music/presentation/views/playlist/playlist.dart';

class AlbumWidget extends StatelessWidget {
  const AlbumWidget({Key? key, required this.album, this.showMenu = true})
      : super(key: key);
  final Album album;
  final bool showMenu;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => Playlist(
                playlistName: album.name,
                playlistType: PlaylistType.album,
              ))),
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6.0)),
        child: FutureBuilder(
            future: getArtWork(album.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  child: Image.memory(snapshot.data as Uint8List,
                      fit: BoxFit.cover),
                );
              }

              return Icon(Icons.album,
                  color: Theme.of(context).iconTheme.color);
            }),
      ),
      title: Text(album.name),
      subtitle: Text(album.noOfSongs),
      trailing: showMenu
          ? const Icon(Icons.more_vert_rounded)
          : const SizedBox.shrink(),
    );
  }
}
