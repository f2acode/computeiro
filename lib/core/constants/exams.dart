import 'package:computeiro/core/models/Exam/question.dart';
import 'package:computeiro/core/models/Exam/asset.dart';
import 'package:computeiro/core/models/Exam/index.dart';

const String downBasePath =
    'https://github.com/amimaro/Provas-POSCOMP/raw/master';

final Exam exam2018 = Exam(
  title: 'POSCOMP 2018',
  year: 2018,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2018',
      link: '$downBasePath/2018/caderno_2018.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2018',
      link: '$downBasePath/2018/gabarito_2018.pdf',
    )
  ],
  questions: <Question>[
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
    ),
  ],
);

final Exam exam2017 = Exam(
  title: 'POSCOMP 2017',
  year: 2017,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2017 - Tipo 1',
      link: '$downBasePath/2017/caderno_2017_tipo1.pdf',
    ),
    Asset(
      title: 'Prova POSCOMP 2017 - Tipo 2',
      link: '$downBasePath/2017/caderno_2017_tipo2.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2017 - Tipo 1 e 2',
      link: '$downBasePath/2017/gabarito_2017_tipo_1_2.pdf',
    ),
  ],
);

final Exam exam2016 = Exam(
  title: 'POSCOMP 2016',
  year: 2016,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2016',
      link: '$downBasePath/2016/caderno_2016.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2016',
      link: '$downBasePath/2016/gabarito_2016.pdf',
    )
  ],
);

final Exam exam2015 = Exam(
  title: 'POSCOMP 2015',
  year: 2015,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2015',
      link: '$downBasePath/2015/caderno_2015.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2015',
      link: '$downBasePath/2015/gabarito_2015.pdf',
    )
  ],
);

final Exam exam2014 = Exam(
  title: 'POSCOMP 2014',
  year: 2014,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2014',
      link: '$downBasePath/2014/caderno_2014.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2014',
      link: '$downBasePath/2014/gabarito_2014.pdf',
    ),
    Asset(
      title: 'Prova Marcada POSCOMP 2014',
      link: '$downBasePath/2014/caderno_2014_marcado.pdf',
    ),
  ],
);

final Exam exam2013 = Exam(
  title: 'POSCOMP 2013',
  year: 2013,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2013',
      link: '$downBasePath/2013/caderno_2013.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2013',
      link: '$downBasePath/2013/gabarito_2013.PDF',
    ),
    Asset(
      title: 'Prova Marcada POSCOMP 2013',
      link: '$downBasePath/2013/caderno_2013_marcado.pdf',
    ),
  ],
);

final Exam exam2012 = Exam(
  title: 'POSCOMP 2012',
  year: 2012,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2012',
      link: '$downBasePath/2012/caderno_2012.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2012',
      link: '$downBasePath/2012/gabarito_2012.PDF',
    ),
    Asset(
      title: 'Prova Marcada POSCOMP 2012',
      link: '$downBasePath/2013/caderno_2012_marcado.pdf',
    ),
  ],
);

final Exam exam2011 = Exam(
  title: 'POSCOMP 2011',
  year: 2011,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2011',
      link: '$downBasePath/2011/caderno_2011.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2011',
      link: '$downBasePath/2011/gabarito_2011.pdf',
    ),
    Asset(
      title: 'Prova Marcada POSCOMP 2011',
      link: '$downBasePath/2011/caderno_2011_marcado.pdf',
    )
  ],
);

final Exam exam2010 = Exam(
  title: 'POSCOMP 2010',
  year: 2010,
  assets: <Asset>[
    Asset(
      title: 'Prova POSCOMP 2010',
      link: '$downBasePath/2010/caderno_2010.pdf',
    ),
    Asset(
      title: 'Gabarito POSCOMP 2010',
      link: '$downBasePath/2010/gabarito_2010.pdf',
    ),
    Asset(
      title: 'Prova Marcada POSCOMP 2010',
      link: '$downBasePath/2010/caderno_2010_marcado.pdf',
    )
  ],
);
