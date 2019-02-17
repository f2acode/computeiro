import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/store/models/Poscomp/index.dart';
import 'package:computeiro/store/actions/index.dart';

class ViewModel {
  ViewModel({
    @required this.poscomp,
    @required this.onSelectAlternativeAction,
    @required this.currentAnswer,
    @required this.questionText,
    @required this.examYear,
    @required this.onNextQuestion,
    @required this.onPreviousQuestion,
  });
  final Poscomp poscomp;
  final Function(String) onSelectAlternativeAction;
  final Function onNextQuestion, onPreviousQuestion;
  final String currentAnswer, questionText;
  final int examYear;

  static ViewModel fromStore(Store<AppState> store) {
    final Poscomp poscomp = store.state.poscomp;
    final int exam = store.state.profile.poscompStatus.exam;
    final int questionIndex = store.state.profile.poscompStatus.questionIndex;
    final List<String> answers = store.state.profile.poscompStatus.answers;

    print(answers);

    return ViewModel(
      poscomp: poscomp,
      examYear: poscomp.exams[exam].year,
      currentAnswer: answers.isNotEmpty ? answers[questionIndex] : '',
      questionText: poscomp.exams[exam].questions[questionIndex].text,
      onSelectAlternativeAction: (String alternative) =>
          store.dispatch(SelectAlternativeAction(alternative, questionIndex)),
      onNextQuestion: () => store.dispatch(NextQuestionAction()),
      onPreviousQuestion: () => store.dispatch(PreviousQuestionAction()),
    );
  }
}
