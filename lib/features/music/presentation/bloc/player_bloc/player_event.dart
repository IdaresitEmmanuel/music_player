part of 'player_bloc.dart';

abstract class PlayerEvent {}

class Play extends PlayerEvent {}

class Pause extends PlayerEvent {}

class Stop extends PlayerEvent {}

class SkipNext extends PlayerEvent {}

class SkipPrevious extends PlayerEvent {}

class PlayStateEvent extends PlayerEvent {
  final bool isPlaying;
  final int currentIndex;
  PlayStateEvent({required this.isPlaying, required this.currentIndex});
}

class LoadPlaylistEvent extends PlayerEvent {
  List<MediaItem> mediaItems;
  int index;
  LoadPlaylistEvent({required this.mediaItems, required this.index});
}

class QueueEvent extends PlayerEvent {
  List<Music> musicList;
  QueueEvent({required this.musicList});
}
