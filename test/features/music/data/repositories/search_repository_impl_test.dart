import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/data/datasources/search_data_source/search_data_source.dart';
import 'package:music_player/features/music/data/repositories/search_repository_impl.dart';
import 'package:music_player/core/constants/enums.dart';

import 'search_repository_impl_test.mocks.dart';

@GenerateMocks([SearchDataSource])
void main() {
  MockSearchDataSource mockSearchDataSource = MockSearchDataSource();
  SearchRepositoryImpl searchRepositoryImpl =
      SearchRepositoryImpl(dataSource: mockSearchDataSource);

  group("getSearchCategory tests", () {
    test("should return a SearchCategory when succesfull", () async {
      // arrange
      when(mockSearchDataSource.getSearchCategory())
          .thenAnswer((_) async => SearchCategory.songs);
      // act
      final result = await searchRepositoryImpl.getSearchCategory();
      // expect
      expect(result, SearchCategory.songs);
      verify(mockSearchDataSource.getSearchCategory());
    });

    test("should return the default SearchCategory when unsuccesfull",
        () async {
      // arrange
      when(mockSearchDataSource.getSearchCategory())
          .thenThrow(SystemException());
      // act
      final result = await searchRepositoryImpl.getSearchCategory();
      // expect
      expect(result, SearchCategory.songs);
      verify(mockSearchDataSource.getSearchCategory());
    });
  });

  group("setSearchCategory tests", () {
    test(
        "should return a unit when true, when setSearchCategory is called successfully",
        () async {
      // arrange
      when(mockSearchDataSource.setSearchCategory(SearchCategory.songs))
          .thenAnswer((_) async => true);

      // act

      final result = await searchRepositoryImpl.setSearchCategory(
          searchCategory: SearchCategory.songs);

      // expect
      expect(result, const Right(unit));
      verify(mockSearchDataSource.setSearchCategory(SearchCategory.songs));
    });

    test(
        "should return a SystemFailure when false, when setSearchCategory is called successfully",
        () async {
      // arrange
      when(mockSearchDataSource.setSearchCategory(SearchCategory.songs))
          .thenAnswer((_) async => false);

      // act

      final result = await searchRepositoryImpl.setSearchCategory(
          searchCategory: SearchCategory.songs);

      // expect
      expect(result, Left(SystemFailure()));
      verify(mockSearchDataSource.setSearchCategory(SearchCategory.songs));
    });

    test(
        "should return a SystemFailure when setSearchCategory throws an exception",
        () async {
      // arrange
      when(mockSearchDataSource.setSearchCategory(SearchCategory.songs))
          .thenThrow(SystemException());

      // act

      final result = await searchRepositoryImpl.setSearchCategory(
          searchCategory: SearchCategory.songs);

      // expect
      expect(result, Left(SystemFailure()));
      verify(mockSearchDataSource.setSearchCategory(SearchCategory.songs));
    });
  });

  // group("getTextFromSpeech tests", () {
  //   test("should return a string when call is successfull", () async {
  //     when(mockSearchDataSource.getTextFromSpeech())
  //         .thenAnswer((_) async => "hello");

  //     final result = await searchRepositoryImpl.getTextFromSpeech();

  //     expect(result, const Right("hello"));
  //     verify(mockSearchDataSource.getTextFromSpeech());
  //   });

  //   test("should return a failure when call is unsuccessfull", () async {
  //     when(mockSearchDataSource.getTextFromSpeech())
  //         .thenThrow(SystemException());

  //     final result = await searchRepositoryImpl.getTextFromSpeech();

  //     expect(result, Left(SystemFailure()));
  //     verify(mockSearchDataSource.getTextFromSpeech());
  //   });
  // });
}
