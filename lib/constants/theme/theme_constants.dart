import 'package:flutter/material.dart';
import 'package:flutter_weather_project/constants/colors.dart';

enum AppTheme { darkTheme, lightTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
        primaryColor: AppColors.darkPrimeryColor,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBGColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.darkPrimeryColor),
        appBarTheme: AppBarTheme(backgroundColor: AppColors.darkBGColor),
        iconTheme: IconThemeData(color: AppColors.highlightColor)),
    AppTheme.lightTheme: ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.lightPrimeryColor,
        scaffoldBackgroundColor: AppColors.lightBGColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.lightPrimeryColor),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.lightBGColor,
            foregroundColor: AppColors.lightTextColor),
        iconTheme: IconThemeData(color: AppColors.highlightColor)),
  };
}
