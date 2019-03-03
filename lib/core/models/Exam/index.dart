import 'package:computeiro/core/models/Exam/question.dart';

class Exam {
  const Exam({this.questions, this.year});
  final List<Question> questions;
  final int year;
}
