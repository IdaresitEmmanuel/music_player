import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/features/music/domain/utilities/helper_functions.dart';

class SongWidget extends StatelessWidget {
  const SongWidget({Key? key, required this.song}) : super(key: key);
  final Music song;
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
            future: getArtWork(song.albumId!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  child: Image.memory(snapshot.data as Uint8List,
                      fit: BoxFit.cover),
                );
              }

              return Icon(Icons.music_note,
                  color: Theme.of(context).iconTheme.color);
            }),
      ),
      title: Text(song.title),
      subtitle: Text(song.artist ?? '<unknown>'),
      trailing: const Icon(Icons.more_vert_rounded),
    );
  }
}
