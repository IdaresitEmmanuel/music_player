import 'package:music_player/features/music/domain/entities/folder.dart';

class FolderModel extends Folder {
  const FolderModel({required String name, required int noOfSongs})
      : super(name: name, noOfSongs: noOfSongs);
}
