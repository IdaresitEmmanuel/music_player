import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:music_player/features/music/data/datasources/search_data_source/search_data_source.dart';
import 'package:music_player/core/constants/enums.dart';

import 'search_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences, SpeechToText])
void main() {
  MockSharedPreferences mockSharedPreferences = MockSharedPreferences();
  SearchDataSourceImpl searchDataSourceImpl =
      SearchDataSourceImpl(sharedPreferences: mockSharedPreferences);

  test("get category test", () async {
    when(mockSharedPreferences.getString(SearchCategory.key.toString()))
        .thenReturn(SearchCategory.songs.toString());

    final result = await searchDataSourceImpl.getSearchCategory();

    expect(result, SearchCategory.songs);
    verify(mockSharedPreferences.getString(SearchCategory.key.toString()));
  });

  test("set category test", () async {
    when(mockSharedPreferences.setString(
            SearchCategory.key.toString(), SearchCategory.songs.toString()))
        .thenAnswer((_) async => true);

    final result =
        await searchDataSourceImpl.setSearchCategory(SearchCategory.songs);

    expect(result, true);
    verify(mockSharedPreferences.setString(
        SearchCategory.key.toString(), SearchCategory.songs.toString()));
  });
}
