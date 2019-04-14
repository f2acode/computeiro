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
        bottomNavIndex: 0,
        exams: <Exam>[
          exam2018,
          exam2017,
          exam2016,
          exam2015,
          exam2014,
          exam2013,
          exam2012,
          exam2011,
          exam2010,
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
