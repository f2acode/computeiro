import 'package:meta/meta.dart';
import 'package:computeiro/store/models/Poscomp/question.dart';
import 'package:computeiro/store/models/Poscomp/questions.dart';
import 'package:computeiro/store/models/Poscomp/exam.dart';

@immutable
class Poscomp {
  const Poscomp({this.exams});

  factory Poscomp.init() => Poscomp(exams: <Exam>[
        Exam(questions: questions2018, year: 2018),
        Exam(questions: <Question>[Question()], year: 2017),
      ]);

  final List<Exam> exams;
}
