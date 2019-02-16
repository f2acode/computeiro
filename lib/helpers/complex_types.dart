import 'package:redux_epics/redux_epics.dart';

import 'package:computeiro/store/models/app_state.dart';
import 'package:computeiro/store/models/Poscomp/index.dart';
import 'package:computeiro/store/models/Profile/index.dart';

typedef EpicType = Stream<dynamic> Function(
  Stream<dynamic> stream,
  EpicStore<AppState> appState,
);

typedef IntReducer = int Function(int a, dynamic dyn);
typedef StringReducer = String Function(String a, dynamic dyn);
typedef BoolReducer = bool Function(bool a, dynamic dyn);
typedef PoscompReducer = Poscomp Function(Poscomp a, dynamic dyn);
typedef ProfileReducer = Profile Function(Profile a, dynamic dyn);
