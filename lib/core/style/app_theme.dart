import 'package:flutter/material.dart';

import 'package:computeiro/core/style/computeiro_colors.dart';

class AppTheme {
  ThemeData get() {
    return ThemeData(
      primaryColor: ComputeiroColors.darkGray,
      accentColor: ComputeiroColors.yellow,
      errorColor: ComputeiroColors.pink,
      scaffoldBackgroundColor: ComputeiroColors.lightGray,
      canvasColor: ComputeiroColors.darkGray,
      //brightness: Brightness.light,
      //backgroundColor: Colors.red,
      //bottomAppBarColor: Colors.red,
      fontFamily: 'Roboto',
      buttonTheme: const ButtonThemeData(
        buttonColor: ComputeiroColors.darkGray,
        textTheme: ButtonTextTheme.accent,
      ),
      textTheme: const TextTheme(
        title: TextStyle(
          fontSize: 24.0,
        ),
        body1: TextStyle(),
      ),
    );
  }
}
