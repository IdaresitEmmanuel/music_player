import 'package:equatable/equatable.dart';

class Music extends Equatable {
  final String title;
  final String artist;
  final String album;
  final String path;

  const Music(
      {required this.title,
      required this.artist,
      required this.album,
      required this.path});

  @override
  List<Object?> get props => [title, artist, album, path];
}
