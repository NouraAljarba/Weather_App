part of 'theme_bloc.dart';

abstract class ThemeState {
  final bool switchValue;

  ThemeState({required this.switchValue});
}

final class ThemeInitial extends ThemeState {
  ThemeInitial({required super.switchValue});
}

final class ThemeDarkState extends ThemeState{
  ThemeDarkState({required super.switchValue});
}

final class ThemeLightState extends ThemeState{
  ThemeLightState ({required super.switchValue});
}