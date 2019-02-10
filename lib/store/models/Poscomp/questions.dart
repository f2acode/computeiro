import 'package:computeiro/store/models/Poscomp/question.dart';

class Questions {
  static final List<Question> questions2018 = [
    Question(
        text:
            '''Para quais valores de _a_, _b_, _c_, _d_, _e_, _f_ a matriz _j_= ![Flutter logo](https://upload.wikimedia.org/wikipedia/commons/b/b9/Matrix_%28maths%29%2C_revised.png) é diagonizável?''',
        answer: 'C'),
    Question(
        text:
            '''Calcule as coordenadas de 1 + 𝑡 + 𝑡^2 na base (1,𝑡 − 1, (𝑡 − 1)^2), considerando 𝑬 = ℝ^𝟐[𝒕], sendo as coordenadas: (𝜆, 𝜇, 𝜂).''',
        answer: 'E'),
  ];
}

enum Answer { A, B, C, D, E }
