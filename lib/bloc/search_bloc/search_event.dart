part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchCityEvent extends SearchEvent {
  final String query;

  SearchCityEvent(this.query);
}
