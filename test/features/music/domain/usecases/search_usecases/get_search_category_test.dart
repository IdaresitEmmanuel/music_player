import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/features/music/domain/repositories/search_repository.dart';
import 'package:music_player/features/music/domain/usecases/search_usecases/get_search_category.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';

import 'get_search_category_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  MockSearchRepository mockSearchRepository = MockSearchRepository();
  GetSearchCategory getSearchCategory = GetSearchCategory(mockSearchRepository);

  test("should return current Search Category", () async {
    // arrange
    when(mockSearchRepository.getSearchCategory())
        .thenAnswer((_) async => SearchCategory.songs);

    // act
    final result = await getSearchCategory();
    // expect
    expect(result, SearchCategory.songs);
    verify(mockSearchRepository.getSearchCategory());
    verifyNoMoreInteractions(mockSearchRepository);
  });
}
