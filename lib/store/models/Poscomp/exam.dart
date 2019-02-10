import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Poscomp/question.dart';

@immutable
class Exam {
  final List<Question> questions;
  final int year;

  Exam({this.questions, this.year});
}
