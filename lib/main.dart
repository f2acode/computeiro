import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:computeiro/app_theme.dart';
import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/store/reducers/app_reducer.dart';
import 'package:computeiro/components/organisms/index.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Computeiro',
        theme: AppTheme().get(),
        home: BottomNavigator(),
      ),
    );
  }
}
