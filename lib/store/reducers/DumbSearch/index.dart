import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';

final dumbSearch = combineReducers<String>([
  TypedReducer<String, SearchResultsAction>(_changeBottomNavIndex),
]);

String _changeBottomNavIndex(String state, SearchResultsAction action) {
  return action.results;
}
