part of 'api_bloc.dart';

abstract class ApiEvent {}

class GetWetherEvent extends ApiEvent {
  final String cityApi;
  GetWetherEvent({required this.cityApi});
}
