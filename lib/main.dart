import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_project/bloc/api_bloc/api_bloc.dart';
import 'package:flutter_weather_project/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_weather_project/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_weather_project/constants/theme/theme_constants.dart';
import 'package:flutter_weather_project/screens/Splash/splash_screen.dart';
import 'package:flutter_weather_project/services/supabase_services.dart';

void main() {
  supabaseConfig();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => ApiBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
