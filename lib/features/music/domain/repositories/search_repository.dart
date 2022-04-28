import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/core/constants/enums.dart';

abstract class SearchRepository {
  Future<SearchCategory> getSearchCategory();
  Future<Either<Failure, Unit>> setSearchCategory(
      {required SearchCategory searchCategory});
}
