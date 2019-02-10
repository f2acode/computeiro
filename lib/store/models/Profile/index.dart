import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Profile/poscomp_status.dart';

@immutable
class Profile {
  final PoscompStatus poscompStatus;

  Profile({this.poscompStatus});

  factory Profile.init() => new Profile();

  // Profile copyWith({List<Exam> exams}) {
  //   return Profile(exams: exams ?? this.exams);
  // }

  // @override
  // int get hashCode => exams.hashCode;

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Profile &&
  //         runtimeType == other.runtimeType &&
  //         exams == other.exams;

  // @override
  // String toString() {
  //   return 'Profile{exams: $exams}';
  // }
}
