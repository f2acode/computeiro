import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/services/index.dart';

class ViewModel {
  ViewModel(BuildContext context) {
    final AppState appState = ScopedModel.of<AppState>(context);
    onDispatchTest = () {
      fetchPost().then<dynamic>((Map<String, dynamic> results) {
        appState.setResultDumbSearch(results['title']);
      }).catchError((dynamic error) => print(error));
    };
    resultDumbSearch = appState.resultDumbSearch;
  }

  Function onDispatchTest;
  String resultDumbSearch;
}
