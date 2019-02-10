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

class SelectAlternativeAction {
  final String alternative;
  final int index;

  SelectAlternativeAction(this.alternative, this.index);

  @override
  String toString() {
    return 'SelectAlternativeAction{alternative: $alternative, index: $index}';
  }
}

class ChangeCurrentExamAction {
  final int examId;

  ChangeCurrentExamAction(this.examId);

  @override
  String toString() {
    return 'ChangeCurrentExamAction{examId: $examId}';
  }
}

class ChangeBottomNavIndexAction {
  final int newBottomNavIndex;

  ChangeBottomNavIndexAction(this.newBottomNavIndex);

  @override
  String toString() {
    return 'ChangeBottomNavIndexAction{changedBottomNavIndex: $newBottomNavIndex}';
  }
}
