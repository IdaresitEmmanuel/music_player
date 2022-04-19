import 'package:flutter/material.dart';

class SongWidget extends StatelessWidget {
  const SongWidget({Key? key, required this.title, required this.artist})
      : super(key: key);
  final String title;
  final String artist;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6.0)),
        child: Icon(Icons.music_note, color: Theme.of(context).iconTheme.color),
      ),
      title: Text(title),
      subtitle: Text(artist),
      trailing: const Icon(Icons.more_vert_rounded),
    );
  }
}
