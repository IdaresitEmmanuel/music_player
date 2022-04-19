import 'package:flutter/material.dart';

class AlbumWidget extends StatelessWidget {
  const AlbumWidget({Key? key, required this.album, required this.noOfSongs})
      : super(key: key);
  final String album;
  final String noOfSongs;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6.0)),
        child: Icon(
          Icons.album,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      title: Text(album),
      subtitle: Text(noOfSongs),
      trailing: const Icon(Icons.more_vert_rounded),
    );
  }
}
