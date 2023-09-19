import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../../models/city.dart';
import '../../services/supabase_services.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WeatherDatabaseService _weatherService = WeatherDatabaseService();

  SearchBloc() : super(SearchInitial()) {
    on<SearchCityEvent>((event, emit) async {
      emit(SearchLoading());
      try {
        List<City> cities;
        if (event.query.isEmpty) {
          cities = await getCities(); // Fetch all cities if query is empty
        } else {
          cities = await _weatherService.getCitiesMatchingQuery(event.query);
        }
        emit(SearchLoaded(cities));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
