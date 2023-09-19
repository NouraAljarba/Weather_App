import 'package:bloc/bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(switchValue: false)) {
    on<ThemeDarkEvent>((event, emit) {
      emit(ThemeDarkState(switchValue: true));
    });

    on<ThemeLightEvent>((event, emit) {
      emit(ThemeLightState(switchValue: false));
    });
  }
}
