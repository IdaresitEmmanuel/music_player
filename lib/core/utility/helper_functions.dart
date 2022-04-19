String getFolderName(String path) {
  var list = path.split('/');
  list.removeLast();
  return list.last;
}

String playListNoToString(int number) {
  if (number == 1) {
    return "$number Song";
  } else {
    return "$number Songs";
  }
}
