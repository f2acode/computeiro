import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, PoscompNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, PoscompNotLoadedAction action) {
  return false;
}
