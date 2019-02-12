import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/store/models/Poscomp/index.dart';
import 'package:computeiro/store/actions/index.dart';

class ViewModel {
  final Poscomp poscomp;
  final bool loading;
  final int bottomNavIndex;
  final Function(int) onChangeBottomNavIndex;
  final Function(String) onDispatchTest;
  final String dumbSearch;

  ViewModel({
    this.poscomp,
    this.loading,
    this.onChangeBottomNavIndex,
    this.bottomNavIndex,
    this.onDispatchTest,
    this.dumbSearch,
  });

  static ViewModel fromStore(Store<AppState> store) {
    return ViewModel(
      poscomp: store.state.poscomp,
      loading: store.state.isLoading,
      bottomNavIndex: store.state.bottomNavIndex,
      onChangeBottomNavIndex: (int newValue) {
        store.dispatch(ChangeBottomNavIndexAction(newValue));
      },
      onDispatchTest: (String newValue) {
        store.dispatch(PerformSearchAction(newValue));
      },
      dumbSearch: store.state.dumbSearch,
    );
  }
}
