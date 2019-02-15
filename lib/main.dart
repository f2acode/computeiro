import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:computeiro/app_theme.dart';
import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/store/reducers/app_reducer.dart';
import 'package:computeiro/components/pages/index.dart';
import 'package:computeiro/store/middlewares/index.dart';

void main() => runApp(App());

typedef ItemCreator = Stream<dynamic> Function(
  Stream<dynamic> stream,
  EpicStore<AppState> appState,
);

class App extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [EpicMiddleware<dynamic>(epics)],
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
