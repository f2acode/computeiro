import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/app_theme.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/components/pages/index.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('testgin');
    /* return ScopedModel<AppState>(
      model: AppState.initial(),
      child: MaterialApp(
        title: 'Computeiro',
        theme: AppTheme().get(),
        home: BottomNavigator(),
      ),
    );
    */
  }
}
