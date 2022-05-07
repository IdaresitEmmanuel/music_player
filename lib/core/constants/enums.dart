enum ThemeSetting {
  key,
  light,
  dark,
}

enum PlaylistType {
  artist,
  album,
  folder,
// userPlaylist
}

enum SearchCategory {
  key,
  songs,
  aritst,
  album,
  folder,
}

enum CustomAction { newPlaylistKey, reorderList, clearList }

enum Reorder { oldIndex, newIndex }

enum SongWidgetType {
  songs,
  search,
  playlist,
}

enum Shuffle {
  key,
  on,
  off,
}

enum Repeat {
  key,
  all,
  single,
  off,
}
