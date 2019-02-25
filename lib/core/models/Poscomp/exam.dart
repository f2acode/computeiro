import 'package:computeiro/core/models/Poscomp/question.dart';

class Exam {
  const Exam({this.questions, this.year});
  final List<Question> questions;
  final int year;
}
