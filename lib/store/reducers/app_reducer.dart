import 'package:computeiro/store/models/app_state.dart';
import 'package:computeiro/store/reducers/index.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    poscomp: poscompReducer(state.poscomp, action),
    profile: profileReducer(state.profile, action),
    bottomNavIndex: bottomNavReducer(state.bottomNavIndex, action),
    dumbSearch: dumbSearch(state.dumbSearch, action),
  );
}
