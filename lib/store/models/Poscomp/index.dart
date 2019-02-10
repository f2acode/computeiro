import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Poscomp/question.dart';
import 'package:computeiro/store/models/Poscomp/questions.dart';
import 'package:computeiro/store/models/Poscomp/exam.dart';

@immutable
class Poscomp {
  final List<Exam> exams;

  Poscomp({this.exams});

  factory Poscomp.init() => new Poscomp(exams: [
        Exam(questions: Questions.questions2018, year: 2018),
        Exam(questions: [Question()], year: 2017),
      ]);
}
