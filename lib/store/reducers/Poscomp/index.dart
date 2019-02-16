import 'package:redux/redux.dart';

import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/Poscomp/index.dart';
import 'package:computeiro/helpers/complex_types.dart';

final Function poscompReducer = combineReducers<Poscomp>(<PoscompReducer>[
  TypedReducer<Poscomp, PoscompLoadedAction>(_onLoaded),
]);

Poscomp _onLoaded(Poscomp state, PoscompLoadedAction action) => state;