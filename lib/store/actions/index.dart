import 'package:computeiro/store/models/Poscomp/index.dart';

class LoadPoscompAction {}

class PoscompNotLoadedAction {}

class PoscompLoadedAction {
  PoscompLoadedAction(this.poscomp);
  final Poscomp poscomp;
}

class NextQuestionAction {
  NextQuestionAction();
}

class PreviousQuestionAction {
  PreviousQuestionAction();
}

class SelectAlternativeAction {
  SelectAlternativeAction(this.alternative, this.index);
  final String alternative;
  final int index;
}

class ChangeCurrentExamAction {
  ChangeCurrentExamAction(this.examId);
  final int examId;
}

class ChangeBottomNavIndexAction {
  ChangeBottomNavIndexAction(this.newBottomNavIndex);
  final int newBottomNavIndex;
}

/* REMOVE AFTER */

class PerformSearchAction {
  PerformSearchAction(this.searchTerm);
  String searchTerm;
}

class SearchResultsAction {
  SearchResultsAction(this.results);
  String results;
}

class SearchErrorAction {
  SearchErrorAction(this.errorMessage);
  String errorMessage;
}
