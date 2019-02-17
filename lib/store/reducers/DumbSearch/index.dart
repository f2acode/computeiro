import 'package:redux/redux.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/helpers/complex_types.dart';

final Function dumbSearch = combineReducers<String>(<StringReducer>[
  TypedReducer<String, SearchResultsAction>(_handleSearchResult),
  TypedReducer<String, SearchErrorAction>(_handleSearchError),
]);

String _handleSearchResult(String state, SearchResultsAction action) {
  print(action.results);
  return action.results;
}

String _handleSearchError(String state, SearchErrorAction action) {
  // Fluttertoast.showToast(
  //   msg: action.errorMessage,
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.TOP,
  //   timeInSecForIos: 1,
  //   backgroundColor: Colors.red,
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );
  print(action.errorMessage);
  return state;
}
