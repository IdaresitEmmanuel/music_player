part of 'playlist_bloc.dart';

@freezed
class PlaylistState with _$PlaylistState {
  const factory PlaylistState({
    required List<Music> musicList,
    required Option<Uint8List> image,
  }) = _PlaylistState;

  factory PlaylistState.initial() =>
      PlaylistState(musicList: [], image: none());
}
