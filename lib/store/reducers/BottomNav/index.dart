import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';

final bottomNavReducer = combineReducers<int>([
  TypedReducer<int, ChangeBottomNavIndexAction>(_changeBottomNavIndex),
]);

int _changeBottomNavIndex(int state, ChangeBottomNavIndexAction action) {
  return action.newBottomNavIndex;
}
