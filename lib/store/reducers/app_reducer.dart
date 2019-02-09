import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/store/reducers/index.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    bottomNavIndex: bottomNavReducer(state.bottomNavIndex, action),
    poscomp: poscompReducer(state.poscomp, action),
  );
}
