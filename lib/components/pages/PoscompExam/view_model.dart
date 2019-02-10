import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/store/models/Poscomp/index.dart';
import 'package:computeiro/store/models/Profile/poscomp_status.dart';
import 'package:computeiro/store/actions/index.dart';

class ViewModel {
  final Poscomp poscomp;
  final Function(String) onSelectAlternativeAction;
  final String currentAnswer, questionText;
  final int examYear;

  ViewModel({
    @required this.poscomp,
    @required this.onSelectAlternativeAction,
    @required this.currentAnswer,
    @required this.questionText,
    @required this.examYear,
  });

  static ViewModel fromStore(Store<AppState> store) {
    Poscomp poscomp = store.state.poscomp;
    PoscompStatus poscompStatus = store.state.profile.poscompStatus;
    List<String> answers = poscompStatus.answers;

    return ViewModel(
      poscomp: poscomp,
      examYear: poscomp.exams[poscompStatus.exam].year,
      currentAnswer:
          answers.isEmpty ? '' : answers[poscompStatus.questionIndex],
      questionText: poscomp
          .exams[poscompStatus.exam].questions[poscompStatus.questionIndex].text
          .toString(),
      onSelectAlternativeAction: (String alternative) => store.dispatch(
          SelectAlternativeAction(alternative, poscompStatus.questionIndex)),
    );
  }
}
