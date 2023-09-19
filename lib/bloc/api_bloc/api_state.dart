part of 'api_bloc.dart';

abstract class ApiState {}

final class ApiInitialState extends ApiState {}

final class GetWeatherSuccsfulState extends ApiState {
  final Weather wether;

  GetWeatherSuccsfulState(this.wether);
}

final class GetWeatherLoadingState extends ApiState {}

final class GetWetherFaildState extends ApiState {}
