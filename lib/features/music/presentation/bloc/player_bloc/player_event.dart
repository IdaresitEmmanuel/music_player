part of 'player_bloc.dart';

abstract class PlayerEvent {}

class Play extends PlayerEvent {}

class Pause extends PlayerEvent {}

class Stop extends PlayerEvent {}

class SkipNext extends PlayerEvent {}

class SkipPrevious extends PlayerEvent {}

class Seek extends PlayerEvent {
  final Duration position;
  Seek({required this.position});
}

class SetShuffleMode extends PlayerEvent {
  SetShuffleMode();
}

class SetRepeatMode extends PlayerEvent {
  SetRepeatMode();
}

class SkipToQueueItem extends PlayerEvent {
  final int index;
  SkipToQueueItem({required this.index});
}

class ReorderQueue extends PlayerEvent {
  final int oldIndex;
  final int newIndex;
  ReorderQueue({required this.oldIndex, required this.newIndex});
}

class RemoveQueueItem extends PlayerEvent {
  final int index;
  RemoveQueueItem({required this.index});
}

class ClearQueue extends PlayerEvent {}

class PlayStateEvent extends PlayerEvent {
  final bool isPlaying;
  final int currentIndex;
  final int currentId;
  final AudioServiceShuffleMode shuffleMode;
  final AudioServiceRepeatMode repeatMode;
  PlayStateEvent(
      {required this.isPlaying,
      required this.currentIndex,
      required this.currentId,
      required this.shuffleMode,
      required this.repeatMode});
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

class MediaItemEvent extends PlayerEvent {
  final Duration songDurarion;
  final Option<Uint8List> musicArt;
  MediaItemEvent({required this.songDurarion, required this.musicArt});
}

class PositionEvent extends PlayerEvent {
  final Duration currentPosition;
  PositionEvent({required this.currentPosition});
}
