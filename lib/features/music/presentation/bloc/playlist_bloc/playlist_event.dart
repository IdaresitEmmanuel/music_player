part of 'playlist_bloc.dart';

abstract class PlaylistEvent {}

class GetPlaylistEvent extends PlaylistEvent {
  final PlaylistType type;
  final String name;
  GetPlaylistEvent({required this.type, required this.name});
}

class GetPlaylistThumbnailEvent extends PlaylistEvent {
  final int id;
  GetPlaylistThumbnailEvent(this.id);
}
