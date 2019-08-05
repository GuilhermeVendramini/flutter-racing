import 'package:flutter/material.dart';
import 'package:racing/src/constants/appColors.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.black,
  appBarTheme: AppBarTheme(
    color: AppColors.black,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.blue,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.blue,
    labelPadding: EdgeInsets.all(10.0),
    unselectedLabelColor: AppColors.white,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColors.transparent),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: AppColors.blue,
    labelStyle: TextStyle(
      color: AppColors.blue,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.blue,
      ),
    ),
  ),
);
