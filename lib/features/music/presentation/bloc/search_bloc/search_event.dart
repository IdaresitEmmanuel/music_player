part of 'search_bloc.dart';

abstract class SearchEvent {}

class SetUp extends SearchEvent {}

class SearchAll extends SearchEvent {
  final String query;
  SearchAll(this.query);
}

class SetSearchCategoryEvent extends SearchEvent {
  final SearchCategory category;
  SetSearchCategoryEvent(this.category);
}

class GetSearchCategoryEvent extends SearchEvent {}
