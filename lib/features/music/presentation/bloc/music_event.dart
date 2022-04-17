part of 'music_bloc.dart';

// @freezed
abstract class MusicEvent
//  with _$MusicEvent
{
  // const factory MusicEvent.getMusic() = GetMusic;
  // const factory MusicEvent.getArtist() = GetArtist;
  // const factory MusicEvent.getAlbum() = GetAlbum;
  // const factory MusicEvent.getFolder() = GetFolder;
}

class GetMusicEvent extends MusicEvent {}

class GetArtistEvent extends MusicEvent {}

class GetAlbumEvent extends MusicEvent {}

class GetFolderEvent extends MusicEvent {}
