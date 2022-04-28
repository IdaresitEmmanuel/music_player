import 'dart:developer';

import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/constants/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SearchDataSource {
  /// fetches the current searchCategory from storage
  ///
  /// Throws a [SystemException] for all error codes
  Future<SearchCategory> getSearchCategory();

  /// set the current searchCategory
  ///
  /// Throws a [SystemException] for all error codes
  Future<bool> setSearchCategory(SearchCategory searchCategory);
}

class SearchDataSourceImpl extends SearchDataSource {
  final SharedPreferences sharedPreferences;

  SearchDataSourceImpl({required this.sharedPreferences});
  @override
  Future<SearchCategory> getSearchCategory() async {
    try {
      final result = sharedPreferences.getString(SearchCategory.key.toString());
      if (result == SearchCategory.aritst.toString()) {
        return SearchCategory.aritst;
      } else if (result == SearchCategory.album.toString()) {
        return SearchCategory.album;
      } else if (result == SearchCategory.folder.toString()) {
        return SearchCategory.folder;
      } else {
        return SearchCategory.songs;
      }
    } catch (e) {
      log("error", error: e);
      return SearchCategory.songs;
    }
  }

  @override
  Future<bool> setSearchCategory(SearchCategory searchCategory) {
    return sharedPreferences.setString(
        SearchCategory.key.toString(), searchCategory.toString());
  }
}
