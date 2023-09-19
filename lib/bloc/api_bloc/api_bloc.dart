import 'package:bloc/bloc.dart';
import 'package:flutter_weather_project/models/weather.dart';
import 'package:flutter_weather_project/services/api_services.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitialState()) {
    on<GetWetherEvent>((event, emit) async {
      emit(GetWeatherLoadingState());
      try {
        final Weather wether = await WeatherService().getWeather(event.cityApi);

        emit(GetWeatherSuccsfulState(wether));
      } catch (e) {
        emit(GetWetherFaildState());
      }
    });
  }
}
