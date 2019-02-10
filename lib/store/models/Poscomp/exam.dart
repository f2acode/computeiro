import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Poscomp/question.dart';

@immutable
class Exam {
  final List<Question> questions;
  final int year;

  Exam({this.questions, this.year});

  // Exam copyWith({List<Question> questions, int year}) {
  //   return Exam(
  //     questions: questions ?? this.questions,
  //     year: year ?? this.year,
  //   );
  // }

  // @override
  // int get hashCode => questions.hashCode ^ answers.hashCode;

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is Exam &&
  //         runtimeType == other.runtimeType &&
  //         questions == other.questions &&
  //         answers == other.answers;

  // @override
  // String toString() {
  //   return 'Exam{questions: $questions, answers: $answers}';
  // }
}
