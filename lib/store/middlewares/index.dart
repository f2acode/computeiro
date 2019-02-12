import 'package:redux_epics/redux_epics.dart';

import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/app_state.dart';
import 'package:computeiro/store/middlewares/DumbSearch/index.dart';

final epics = combineEpics<AppState>([
  TypedEpic<AppState, PerformSearchAction>(searchEpic),
]);
