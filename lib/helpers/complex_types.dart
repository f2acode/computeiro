import 'package:redux_epics/redux_epics.dart';

import 'package:computeiro/store/models/app_state.dart';

typedef combineEpicsType = Stream<dynamic> Function(
  Stream<dynamic> stream,
  EpicStore<AppState> appState,
);
