import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Poscomp/question.dart';
import 'package:computeiro/store/models/Poscomp/exam.dart';

@immutable
class Poscomp {
  final List<Exam> exams;

  Poscomp({this.exams});

  factory Poscomp.init() => new Poscomp(exams: [
        Exam(questions: [Question()], year: 2018),
        Exam(questions: [Question()], year: 2017),
      ]);

  // Poscomp copyWith({List<Exam> exams}) {
  //   return Poscomp(exams: exams ?? this.exams);
  // }

  // @override
  // int get hashCode => exams.hashCode;

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Poscomp &&
  //         runtimeType == other.runtimeType &&
  //         exams == other.exams;

  // @override
  // String toString() {
  //   return 'Poscomp{exams: $exams}';
  // }
}
