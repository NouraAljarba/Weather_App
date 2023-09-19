import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_project/bloc/theme_bloc/theme_bloc.dart';

appBarWidget({required String title}) {
  return AppBar(
    title: Text(title),
    actions: [
      BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Switch(
            value: state.switchValue,
            onChanged: (value) {
              value
                  ? context.read<ThemeBloc>().add(ThemeDarkEvent())
                  : context.read<ThemeBloc>().add(ThemeLightEvent());
            },
          );
        },
      )
    ],
    elevation: 0,
  );
}
