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
  final AudioServiceShuffleMode shuffleMode;
  PlayStateEvent(
      {required this.isPlaying,
      required this.currentIndex,
      required this.shuffleMode});
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

class Seek extends PlayerEvent {
  final Duration position;
  Seek({required this.position});
}

class SetShuffleMode extends PlayerEvent {
  SetShuffleMode();
}

class SetRepeatMode extends PlayerEvent {
  final AudioServiceRepeatMode repeatMode;
  SetRepeatMode({required this.repeatMode});
}
