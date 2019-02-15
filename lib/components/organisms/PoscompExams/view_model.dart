import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/store/models/Poscomp/index.dart';
import 'package:computeiro/store/actions/index.dart';

class ViewModel {
  ViewModel(
      {@required this.poscomp,
      @required this.loading,
      @required this.onChangeCurrentExam});

  final Poscomp poscomp;
  final bool loading;
  final Function(int) onChangeCurrentExam;

  static ViewModel fromStore(Store<AppState> store) {
    return ViewModel(
      poscomp: store.state.poscomp,
      loading: store.state.isLoading,
      onChangeCurrentExam: (int newValue) {
        store.dispatch(ChangeCurrentExamAction(newValue));
      },
    );
  }
}
