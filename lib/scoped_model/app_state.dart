import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/core/models/index.dart';
import 'package:computeiro/core/constants/exams.dart';

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
        poscomp: Poscomp(
          exams: <Exam>[
            Exam(questions: exam2018, year: 2018),
            Exam(questions: exam2017, year: 2017),
          ],
        ),
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
