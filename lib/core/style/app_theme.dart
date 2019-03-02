import 'package:flutter/material.dart';

import 'package:computeiro/core/style/index.dart';

class AppTheme {
  ThemeData get() {
    return ThemeData(
      primaryColor: darkGray,
      accentColor: yellow,
      errorColor: pink,
      scaffoldBackgroundColor: lightGray,
      canvasColor: darkGray,
      //brightness: Brightness.light,
      //backgroundColor: Colors.red,
      //bottomAppBarColor: Colors.red,
      fontFamily: 'Roboto',
      buttonTheme: const ButtonThemeData(
        buttonColor: darkGray,
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
