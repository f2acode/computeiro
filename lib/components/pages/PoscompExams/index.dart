import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/components/pages/PoscompExams/view_model.dart';

class PoscompExams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
