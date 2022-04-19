import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:music_player/features/music/domain/entities/album.dart';
import 'package:music_player/features/music/domain/utilities/helper_functions.dart';

class AlbumWidget extends StatelessWidget {
  const AlbumWidget({Key? key, required this.album}) : super(key: key);
  final Album album;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      trailing: const Icon(Icons.more_vert_rounded),
    );
  }
}
