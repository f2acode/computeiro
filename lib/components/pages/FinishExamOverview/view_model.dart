import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/core/models/index.dart';

class ViewModel {
  ViewModel(BuildContext context) {
    final AppState appState = ScopedModel.of<AppState>(context);
    final Exam userExam = appState.exams[appState.profile.poscompStatus.exam];
    final List<dynamic> userAnswers = appState.profile.poscompStatus.answers;

    loading = appState.isLoading;

    final List<bool> userHits = <bool>[];
    for (int i = 0; i < userAnswers.length - 1; i++) {
      if (userAnswers[i] == userExam.questions[i].correctAnswer) {
        userHits.add(true);
      } else {
        userHits.add(false);
      }
    }

    total = userAnswers.length - 1;
    hits = userHits.where((bool h) => h == true).length;
    percentage = hits / total;
    uAnswersResult = userHits;
    uAnswers = userAnswers;
  }

  bool loading;
  int total;
  int hits;
  double percentage;
  List<bool> uAnswersResult;
  List<dynamic> uAnswers;
}
