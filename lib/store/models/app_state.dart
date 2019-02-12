import 'package:meta/meta.dart';
import 'package:computeiro/store/models/index.dart';

@immutable
class AppState {
  final bool isLoading;
  final int bottomNavIndex;
  final Poscomp poscomp;
  final Profile profile;
  final String dumbSearch;

  AppState({
    this.isLoading = false,
    this.poscomp,
    this.bottomNavIndex,
    this.profile,
    this.dumbSearch,
  });

  factory AppState.initial() => new AppState(
        isLoading: true,
        bottomNavIndex: 1,
        poscomp: Poscomp.init(),
        profile: Profile.init(),
        dumbSearch: '',
      );

  AppState copyWith({
    bool isLoading,
    Poscomp poscomp,
    int bottomNavIndex,
    Profile profile,
  }) {
    return new AppState(
      isLoading: isLoading ?? this.isLoading,
      poscomp: poscomp ?? this.poscomp,
      bottomNavIndex: bottomNavIndex ?? this.bottomNavIndex,
      profile: profile ?? this.profile,
    );
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      poscomp.hashCode ^
      bottomNavIndex.hashCode ^
      profile.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          poscomp == other.poscomp &&
          bottomNavIndex == other.bottomNavIndex &&
          profile == other.profile;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, poscomp: $poscomp, bottomNavIndex: $bottomNavIndex}, profile: $profile';
  }
}
