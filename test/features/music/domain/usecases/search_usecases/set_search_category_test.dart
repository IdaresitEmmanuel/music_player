import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/repositories/search_repository.dart';
import 'package:music_player/features/music/domain/usecases/search_usecases/set_search_category.dart';
import 'package:music_player/core/constants/enums.dart';

import 'set_search_category_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  MockSearchRepository mockSearchRepository = MockSearchRepository();
  SetSearchCategory setSearchCategory = SetSearchCategory(mockSearchRepository);

  test("should return a unit when setSearchCategory is called", () async {
    // arrange
    when(mockSearchRepository.setSearchCategory(
            searchCategory: SearchCategory.songs))
        .thenAnswer((_) async => const Right(unit));

    // act

    final result = await setSearchCategory(SearchCategory.songs);

    // expect
    expect(result, const Right(unit));
    verify(mockSearchRepository.setSearchCategory(
        searchCategory: SearchCategory.songs));
  });

  test("should return a failure when setSearchCategory is called", () async {
    // arrange
    when(mockSearchRepository.setSearchCategory(
            searchCategory: SearchCategory.songs))
        .thenAnswer((_) async => Left(SystemFailure()));

    // act

    final result = await setSearchCategory(SearchCategory.songs);

    // expect
    expect(result, Left(SystemFailure()));
    verify(mockSearchRepository.setSearchCategory(
        searchCategory: SearchCategory.songs));
  });
}
