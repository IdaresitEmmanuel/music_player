import 'package:flutter/material.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({Key? key, required this.folder, required this.noOfSongs})
      : super(key: key);
  final String folder;
  final String noOfSongs;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.folder_rounded,
        color: Theme.of(context).cardColor,
        size: 64,
      ),
      title: Text(folder),
      subtitle: Text(noOfSongs),
      trailing: const Icon(Icons.more_vert_rounded),
    );
  }
}
