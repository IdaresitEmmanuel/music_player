part of 'music_bloc.dart';

abstract class MusicEvent {}

class GetMusicEvent extends MusicEvent {}

class GetArtistEvent extends MusicEvent {}

class GetAlbumEvent extends MusicEvent {}

class GetFolderEvent extends MusicEvent {}

class StartEvent extends MusicEvent {}

class RequestStoragePermissionEvent extends MusicEvent {}
