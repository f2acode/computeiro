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

class ChangeCurrentExamAction {
  final int examId;

  ChangeCurrentExamAction(this.examId);

  @override
  String toString() {
    return 'PoscompLoadedAction{examId: $examId}';
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
