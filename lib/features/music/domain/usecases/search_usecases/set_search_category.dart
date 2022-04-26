import 'package:dartz/dartz.dart';
import 'package:music_player/core/error/failures.dart';
import 'package:music_player/features/music/domain/repositories/search_repository.dart';
import 'package:music_player/features/music/domain/utilities/enums.dart';

class SetSearchCategory {
  SearchRepository searchRepository;
  SetSearchCategory(this.searchRepository);

  Future<Either<Failure, Unit>> call(SearchCategory searchCategory) async {
    return searchRepository.setSearchCategory(searchCategory: searchCategory);
  }
}
