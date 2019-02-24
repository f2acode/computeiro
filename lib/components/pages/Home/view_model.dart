import 'package:redux/redux.dart';

import 'package:computeiro/store/models/app_state.dart';
import 'package:computeiro/core/models/Poscomp/index.dart';
import 'package:computeiro/store/actions/index.dart';

class ViewModel {
  ViewModel({
    this.poscomp,
    this.loading,
    this.onChangeBottomNavIndex,
    this.bottomNavIndex,
    this.onDispatchTest,
    this.dumbSearch,
  });

  final Poscomp poscomp;
  final bool loading;
  final int bottomNavIndex;
  final Function(int) onChangeBottomNavIndex;
  final Function(String) onDispatchTest;
  final String dumbSearch;

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
