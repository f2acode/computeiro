import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/models/index.dart';

class ViewModel {
  ViewModel(BuildContext context) {
    final AppState appState = ScopedModel.of<AppState>(
      context,
      rebuildOnChange: true,
    );

    final Profile profile = appState.profile;
    final int examIndex = profile.poscompStatus.exam;
    final Exam currentExam = appState.exams[examIndex];
    final List<String> answers = profile.poscompStatus.answers;

    examYear = currentExam.year;
    questionIndex = profile.poscompStatus.questionIndex;
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

  Function(String) onSelectAlternativeAction;
  Function onNextQuestion, onPreviousQuestion;
  String currentAnswer, questionText;
  List<String> questionAlternatives;
  int examYear, questionIndex;
}
