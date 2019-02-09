import 'package:flutter/material.dart';

import 'package:computeiro/helpers/computeiro_colors.dart';

class AppTheme {
  ThemeData get() {
    return ThemeData(
      primaryColor: XerpayColors.white,
      primaryColorLight: XerpayColors.lightGrey,
      accentColor: XerpayColors.green,
      brightness: Brightness.light,
      errorColor: XerpayColors.red,
      fontFamily: 'Roboto',
      textTheme: TextTheme(
        title: TextStyle(fontSize: 24.0),
        body1: TextStyle(fontSize: 18.0),
        body2: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
