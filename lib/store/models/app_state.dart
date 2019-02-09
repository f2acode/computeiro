import 'package:meta/meta.dart';
import 'package:computeiro/store/models/index.dart';

@immutable
class AppState {
  final bool isLoading;
  final int bottomNavIndex;
  final Poscomp poscomp;

  AppState({this.isLoading = false, this.poscomp, this.bottomNavIndex});

  factory AppState.loading() => AppState(
        isLoading: true,
        poscomp: Poscomp(balance: 0),
        bottomNavIndex: 0,
      );

  AppState copyWith({
    bool isLoading,
    Poscomp poscomp,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      poscomp: poscomp ?? this.poscomp,
      bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
    );
  }

  @override
  int get hashCode => isLoading.hashCode ^ poscomp.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          poscomp == other.poscomp;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, poscomp: $poscomp}';
  }
}
