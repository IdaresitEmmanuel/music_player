String getFolderName(String path) {
  var list = path.split('/');
  list.removeLast();
  return list.last;
}
