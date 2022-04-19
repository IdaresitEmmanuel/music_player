import 'package:equatable/equatable.dart';

class Music extends Equatable {
  final int id;
  final String title;
  final String? album;
  final int? albumId;
  final String? artist;
  final int? artistId;
  final int? dateAdded;
  final int? duration;
  final String path;
  final String data;
  final String? uri;
  final int size;

  const Music({
    required this.id,
    required this.title,
    this.album,
    this.albumId,
    this.artist,
    this.artistId,
    this.dateAdded,
    this.duration,
    required this.path,
    required this.data,
    this.uri,
    required this.size,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        album,
        albumId,
        artist,
        artistId,
        dateAdded,
        duration,
        path,
        data,
        uri,
        size
      ];
}
