import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_tex/flutter_tex.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/constants/index.dart';

import 'package:computeiro/components/organisms/index.dart';
import 'package:computeiro/components/pages/Exam/view_model.dart';

class Exam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String teX = Uri.encodeComponent(r'''

  <p>

    A simple Example to render \( \rm\\TeX \) in flutter<br>

    <style>
      .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        transition: 0.3s;
        width: 40%;
      }

      .card:hover {
        box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
      }

      .container {
        padding: 2px 16px;
      }
    </style>
    <div class="card">
      <div class="container">
        <p>
          \begin{align}
          \dot{x} & = \sigma(y-x) \\
          \dot{y} & = \rho x - y - xz \\
          \dot{z} & = -\beta z + xy
          \end{align}
        </p>
      </div>
    </div>

    <br>
    <br>

    When \(a \ne 0 \), there are two solutions to \(ax^2 + bx + c = 0\) and they are

    $$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$<br>

    $$ \oint_C {E \cdot d\ell = - \frac{d}{{dt}}} \int_S {B_n dA} $$<br>

    Bohr Radius

    \( a_0 = \frac{{\hbar ^2 }}{{m_e ke^2 }} \)<br>

    Relationship between Energy and Principal Quantum Number

    \( E_n = - R_H \left( {\frac{1}{{n^2 }}} \right) = \frac{{ - 2.178 \times 10^{ - 18} }}{{n^2 }}joule \)<br><br>

    $$\ce{CO2 + C -> 2 CO}$$ <br><br>
 
    $$\ce{Hg^2+ ->[I-] HgI2 ->[I-] [Hg^{II}I4]^2-}$$ <br><br>

    $$\ce{x Na(NH4)HPO4 ->[\Delta] (NaPO3)_x + x NH3 ^ + x H2O}$$ <br><br>

  </p>
  ''');

    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget child, AppState appState) {
        final ViewModel vm = ViewModel(ctx);
        return Scaffold(
          appBar: AppBar(
            title: Text(poscompExamYear(vm.examYear.toString())),
          ),
          body: Padding(
              padding: const EdgeInsets.all(15),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    child: TeXView(
                      teXHTML: teX,
                    ),
                  ),
                ],
              )
              /* Question(
              questionText: vm.questionText,
              questionIndex: vm.questionIndex,
              currentAnswer: vm.currentAnswer,
              alternatives: const <String>['A', 'B', 'C', 'D', 'E'],
              questionAlternatives: vm.questionAlternatives,
              onSelectAlternativeAction: vm.onSelectAlternativeAction,
              onNextQuestion: vm.onNextQuestion,
              onPreviousQuestion: vm.onPreviousQuestion,
            ), */

              ),
        );
      },
    );
  }
}
