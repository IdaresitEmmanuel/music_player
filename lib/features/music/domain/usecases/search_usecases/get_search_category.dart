import 'package:music_player/features/music/domain/repositories/search_repository.dart';
import 'package:music_player/core/constants/enums.dart';

class GetSearchCategory {
  SearchRepository searchRepository;
  GetSearchCategory(this.searchRepository);

  Future<SearchCategory> call() async {
    return searchRepository.getSearchCategory();
  }
}
