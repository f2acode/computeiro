import 'package:computeiro/core/models/Poscomp/question.dart';
import 'package:computeiro/core/models/Poscomp/questions.dart';
import 'package:computeiro/core/models/Poscomp/exam.dart';

class Poscomp {
  const Poscomp({this.exams});

  factory Poscomp.init() => Poscomp(exams: <Exam>[
        Exam(questions: questions2018, year: 2018),
        Exam(questions: <Question>[Question()], year: 2017),
      ]);

  final List<Exam> exams;
}
