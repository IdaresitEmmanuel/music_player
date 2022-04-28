import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/core/utilities/helper_functions.dart';
import 'package:music_player/features/music/data/models/folder_model.dart';
import 'package:music_player/features/music/domain/entities/folder.dart';

void main() {
  final folderModel =
      FolderModel(name: 'folder', noOfSongs: playListNoToString(4));

  test('should be a subclass of Folder entity', () async {
    expect(folderModel, isA<Folder>());
  });
}
