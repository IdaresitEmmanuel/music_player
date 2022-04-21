import 'package:flutter/material.dart';
import 'package:music_player/features/music/presentation/views/playlist/playlist.dart';

class ArtistWidget extends StatelessWidget {
  const ArtistWidget({Key? key, required this.artist, required this.noOfSongs})
      : super(key: key);
  final String artist;
  final String noOfSongs;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const Playlist())),
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(Icons.person, color: Theme.of(context).iconTheme.color),
      ),
      title: Text(artist),
      subtitle: Text(noOfSongs),
      trailing: const Icon(Icons.more_vert_rounded),
    );
  }
}
