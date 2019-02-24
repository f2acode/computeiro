import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/core/helpers/complex_types.dart';

final Function bottomNavReducer = combineReducers<int>(<IntReducer>[
  TypedReducer<int, ChangeBottomNavIndexAction>(_changeBottomNavIndex),
]);

int _changeBottomNavIndex(int state, ChangeBottomNavIndexAction action) {
  return action.newBottomNavIndex;
}
