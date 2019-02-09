import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/store/actions/index.dart';

class ViewModel {
  final Poscomp poscomp;
  final bool loading;
  final int bottomNavIndex;
  final Function(int) onChangeBottomNavIndex;

  ViewModel({
    @required this.poscomp,
    @required this.loading,
    @required this.onChangeBottomNavIndex,
    @required this.bottomNavIndex,
  });

  static ViewModel fromStore(Store<AppState> store) {
    return ViewModel(
      poscomp: store.state.poscomp,
      loading: store.state.isLoading,
      bottomNavIndex: store.state.bottomNavIndex,
      onChangeBottomNavIndex: (int newValue) {
        store.dispatch(ChangeBottomNavIndexAction(newValue));
      },
    );
  }
}
