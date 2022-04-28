import 'package:music_player/core/error/exceptions.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:music_player/features/music/data/datasources/search_data_source/search_data_source.dart';
import 'package:music_player/features/music/domain/repositories/search_repository.dart';
import 'package:music_player/core/constants/enums.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchDataSource dataSource;
  SearchRepositoryImpl({required this.dataSource});
  @override
  Future<SearchCategory> getSearchCategory() async {
    try {
      return dataSource.getSearchCategory();
    } on SystemException {
      return SearchCategory.songs;
    }
  }

  @override
  Future<Either<Failure, Unit>> setSearchCategory(
      {required SearchCategory searchCategory}) async {
    try {
      final result = await dataSource.setSearchCategory(searchCategory);
      return result ? const Right(unit) : Left(SystemFailure());
    } on SystemException {
      return Left(SystemFailure());
    }
  }

  // @override
  // Future<Either<Failure, String>> getTextFromSpeech() async {
  //   try {
  //     return Right(await dataSource.getTextFromSpeech());
  //   } on SystemException {
  //     return Left(SystemFailure());
  //   }
  // }
}
