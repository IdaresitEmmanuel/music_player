import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:music_player/features/music/domain/entities/music.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/presentation/bloc/music_bloc/music_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/player_bloc/player_bloc.dart';
import 'package:music_player/features/music/presentation/bloc/playlist_bloc/playlist_bloc.dart';

class SongWidget extends StatelessWidget {
  const SongWidget(
      {Key? key,
      required this.song,
      this.showMenu = true,
      required this.index,
      this.songWidgetType = SongWidgetType.songs})
      : super(key: key);
  final Music song;
  final bool showMenu;
  final int index;
  final SongWidgetType songWidgetType;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        final musicList = <Music>[];
        switch (songWidgetType) {
          case SongWidgetType.songs:
            musicList.addAll(context.read<MusicBloc>().state.musicList);
            break;
          case SongWidgetType.search:
            musicList.add(song);
            break;
          case SongWidgetType.playlist:
            musicList.addAll(context.read<PlaylistBloc>().state.musicList);
            break;
        }

        context.read<PlayerBloc>().add(LoadPlaylistEvent(
            mediaItems: musicToMediaItem(musicList), index: index));
      },
      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(6.0)),
        child: FutureBuilder(
            future: 
                getArtWork(song.id),
                
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
      title: Text(song.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(song.artist ?? '<unknown>',
          maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: showMenu
          ? const Icon(Icons.more_vert_rounded)
          : const SizedBox.shrink(),
    );
  }
}
