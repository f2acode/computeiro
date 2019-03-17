import 'package:computeiro/core/models/Exam/question.dart';

final List<Question> exam2018 = <Question>[
  Question(
    text: Uri.encodeComponent(r'''
    <style>
      p {
        font-size: 16px;
      }
    </style>
      <p>
        Para quais valores de \(a\), \(b\), \(c\), \(d\), \(e\), \(f\) a matriz 
        \(j = \left(
          \begin{array}{cccc}
          3 & 0 & 0 & 0 \\
          a & 2 & d & e \\
          b & 0 & 1 & 0 \\
          c & 0 & f & 0
          \end{array}
        \right)\)
        é diagonizável?
      </p>

      <p>A) Não pode ser diagonalizável.</p>
      <p>B) Apenas para números inteiros.</p>
      <p>C) Somente para números positivos.</p>
      <p>D) Para quaisquer valores.</p>
      <p>E) Somente para valores nulos.</p>
    '''),
    correctAnswer: 'C',
    alternatives: <String>[
      Uri.encodeComponent(''),
      Uri.encodeComponent(''),
      Uri.encodeComponent(''),
      Uri.encodeComponent(''),
      Uri.encodeComponent('')
    ],
  ),
  Question(
    text: Uri.encodeComponent(r'''
    <style>
      p {
        font-size: 16px;
      }
    </style>
      <p>
        Calcule as coordenadas de \(1 + t + t^2\) na base \((1, t - 1, (t - 1)^2)\),
        considerando \(E = \mathbb{R}_2[t]\), sendo as coordenadas: \(\lambda, \mu, \eta\).
      </p>

      <p>A)\(\eta\) = 1, \(\mu\)= 3, \(\lambda\)= 3</p>
      <p>B)\(\eta\) = 0, \(\mu\)= 3, \(\lambda\)= 3</p>
      <p>C)\(\eta\) = -1, \(\mu\)= 1, \(\lambda\)= 1</p>
      <p>D)\(\eta\) = 1, \(\mu\)= 2, \(\lambda\)= 3</p>
      <p>E)\(\eta\) = 3, \(\mu\)= 3, \(\lambda\)= 3</p>
    '''),
    correctAnswer: 'E',
    alternatives: <String>[
      'bla bla',
      'ahsdhasd',
      'oioioi',
      'jurubeba',
      'asdasd'
    ],
  ),
];

/* final List<Question> exam2017 = <Question>[
  Question(
    text: '''
          Para quais valores de _a_, _b_, _c_, _d_, _e_, _f_ a matriz _j_= 
          ![Flutter logo](https://upload.wikimedia.org/wikipedia/commons/b/b9/Matrix_%28maths%29%2C_revised.png) é diagonizável?
          ''',
    correctAnswer: 'C',
    alternatives: <String>[
      'bla bla',
      'ahsdhasd',
      'oioioi',
      'jurubeba',
      'asdasd'
    ],
  ),
  Question(
    text: '''
          Calcule as coordenadas de 1 + 𝑡 + 𝑡^2 na base (1,𝑡 − 1, (𝑡 − 1)^2), considerando 𝑬 = ℝ^𝟐[𝒕], sendo as coordenadas: (𝜆, 𝜇, 𝜂).
          ''',
    correctAnswer: 'E',
    alternatives: <String>[
      'bla bla',
      'ahsdhasd',
      'oioioi',
      'jurubeba',
      'asdasd'
    ],
  ),
]; */
