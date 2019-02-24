import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/core/helpers/complex_types.dart';

final Function loadingReducer = combineReducers<bool>(<BoolReducer>[
  TypedReducer<bool, PoscompNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, PoscompNotLoadedAction action) {
  return false;
}
