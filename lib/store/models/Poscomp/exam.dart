import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Poscomp/question.dart';

@immutable
class Exam {
  const Exam({this.questions, this.year});
  final List<Question> questions;
  final int year;
}
