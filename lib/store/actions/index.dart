import 'package:computeiro/store/models/Poscomp/index.dart';

class LoadPoscompAction {}

class PoscompNotLoadedAction {}

class PoscompLoadedAction {
  final Poscomp poscomp;

  PoscompLoadedAction(this.poscomp);
}

class NextQuestionAction {
  NextQuestionAction();
}

class PreviousQuestionAction {
  PreviousQuestionAction();
}

class SelectAlternativeAction {
  final String alternative;
  final int index;

  SelectAlternativeAction(this.alternative, this.index);
}

class ChangeCurrentExamAction {
  final int examId;

  ChangeCurrentExamAction(this.examId);
}

class ChangeBottomNavIndexAction {
  final int newBottomNavIndex;

  ChangeBottomNavIndexAction(this.newBottomNavIndex);
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
  SearchErrorAction(this.error);
  String error;
}
