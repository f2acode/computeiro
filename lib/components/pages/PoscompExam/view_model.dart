import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/core/models/Poscomp/index.dart';
import 'package:computeiro/core/models/index.dart';

class ViewModel {
  ViewModel(BuildContext context) {
    final AppState appState =
        ScopedModel.of<AppState>(context, rebuildOnChange: true);

    final Poscomp pos = appState.poscomp;
    final int examIndex = appState.profile.poscompStatus.exam;
    final Exam currentExam = pos.exams[examIndex];
    final int questionIndex = appState.profile.poscompStatus.questionIndex;
    final List<String> answers = appState.profile.poscompStatus.answers;

    poscomp = pos;
    examYear = currentExam.year;
    currentAnswer = answers.isNotEmpty ? answers[questionIndex] : '';
    questionText = currentExam.questions[questionIndex].text;
    questionAlternatives = currentExam.questions[questionIndex].alternatives;

    onSelectAlternativeAction = (String alternative) {
      appState.profile.poscompStatus.insertAnswer(
        alternative: alternative,
        questionIndex: questionIndex,
      );

      appState.notifyListeners();
    };
    onNextQuestion = () {
      appState.profile.poscompStatus.nextQuestion();
      appState.notifyListeners();
    };
    onPreviousQuestion = () {
      appState.profile.poscompStatus.previousQuestion();
      appState.notifyListeners();
    };
  }

  Poscomp poscomp;
  Function(String) onSelectAlternativeAction;
  Function onNextQuestion, onPreviousQuestion;
  String currentAnswer, questionText;
  List<String> questionAlternatives;
  int examYear;
}
