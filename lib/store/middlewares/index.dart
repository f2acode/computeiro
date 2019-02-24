import 'package:redux_epics/redux_epics.dart';

import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/app_state.dart';
import 'package:computeiro/store/middlewares/DumbSearch/index.dart';
import 'package:computeiro/core/helpers/complex_types.dart';

final Function epics = combineEpics<AppState>(<EpicType>[
  TypedEpic<AppState, PerformSearchAction>(searchEpic),
]);
