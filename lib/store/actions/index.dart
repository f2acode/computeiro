import 'package:computeiro/store/models/index.dart';

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

class UpdatePoscompBalanceAction {
  final int newPoscompBalance;

  UpdatePoscompBalanceAction(this.newPoscompBalance);

  @override
  String toString() {
    return 'UpdatePoscompBalanceAction{updatedPoscompBalance: $newPoscompBalance}';
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
