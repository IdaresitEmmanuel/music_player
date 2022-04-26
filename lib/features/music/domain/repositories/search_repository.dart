import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';

abstract class SearchRepository {
  // Future<Either<Failure, String>> getTextFromSpeech();
  Future<SearchCategory> getSearchCategory();
  Future<Either<Failure, Unit>> setSearchCategory(
      {required SearchCategory searchCategory});
}
