import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';

final dumbSearch = combineReducers<String>([
  TypedReducer<String, SearchResultsAction>(_handleSearchResult),
  TypedReducer<String, SearchErrorAction>(_handleSearchError),
]);

String _handleSearchResult(String state, SearchResultsAction action) {
  return action.results;
}

String _handleSearchError(String state, SearchErrorAction action) {
  print(action.error);
  return state;
}
