import 'package:computeiro/store/models/Poscomp/index.dart';

class LoadPoscompAction {}

class PoscompNotLoadedAction {}

class PoscompLoadedAction {
  final Poscomp poscomp;

  PoscompLoadedAction(this.poscomp);

  @override
  String toString() {
    return 'PoscompLoadedAction{poscomp: $poscomp}';
  }
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
