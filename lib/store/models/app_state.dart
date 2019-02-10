import 'package:meta/meta.dart';
import 'package:computeiro/store/models/index.dart';

@immutable
class AppState {
  final bool isLoading;
  final int bottomNavIndex;
  final Poscomp poscomp;
  final Profile profile;

  AppState({
    this.isLoading = false,
    this.poscomp,
    this.bottomNavIndex,
    this.profile,
  });

  factory AppState.initial() => new AppState(
        isLoading: true,
        poscomp: Poscomp.init(),
        bottomNavIndex: 1,
      );

  AppState copyWith({
    bool isLoading,
    Poscomp poscomp,
    int bottomNavIndex,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      poscomp: poscomp ?? this.poscomp,
      bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^ poscomp.hashCode ^ bottomNavIndex.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          poscomp == other.poscomp &&
          bottomNavIndex == other.bottomNavIndex;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, poscomp: $poscomp, bottomNavIndex: $bottomNavIndex}';
  }
}
