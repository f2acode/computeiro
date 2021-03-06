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
      fontFamily: 'Roboto',
      buttonTheme: const ButtonThemeData(
        buttonColor: darkGray,
        textTheme: ButtonTextTheme.accent,
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: 24.0,
        ),
        bodyText2: TextStyle(),
      ),
    );
  }
}
