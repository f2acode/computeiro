import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/Poscomp/index.dart';

final poscompReducer = combineReducers<Poscomp>([
  TypedReducer<Poscomp, PoscompLoadedAction>(_onLoaded),
]);

Poscomp _onLoaded(Poscomp state, PoscompLoadedAction action) => state;
