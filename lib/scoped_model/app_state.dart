import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/core/models/index.dart';

class AppState extends Model {
  AppState({
    this.isLoading,
    this.poscomp,
    this.bottomNavIndex,
    this.profile,
    this.resultDumbSearch,
  });

  factory AppState.initial() => AppState(
        isLoading: true,
        bottomNavIndex: 1,
        poscomp: Poscomp.init(),
        profile: Profile.init(),
        resultDumbSearch: '',
      );

  void setBottomNavIndex(int newIndex) {
    bottomNavIndex = newIndex;
    notifyListeners();
  }

  void setResultDumbSearch(String result) {
    resultDumbSearch = result;
    notifyListeners();
  }

  bool isLoading;
  int bottomNavIndex;
  Poscomp poscomp;
  Profile profile;
  String resultDumbSearch;
}
