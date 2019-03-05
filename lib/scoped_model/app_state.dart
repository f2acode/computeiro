import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/core/models/index.dart';
import 'package:computeiro/core/constants/index.dart';

class AppState extends Model {
  AppState({
    this.isLoading,
    this.exams,
    this.bottomNavIndex,
    this.profile,
    this.resultDumbSearch,
  });

  factory AppState.initial() => AppState(
        isLoading: true,
        bottomNavIndex: 2,
        exams: <Exam>[
          Exam(questions: exam2018, year: 2018),
          Exam(questions: exam2017, year: 2017),
        ],
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
  List<Exam> exams;
  Profile profile;
  String resultDumbSearch;
}
