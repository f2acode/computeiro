import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/core/models/index.dart';

class ViewModel {
  ViewModel(BuildContext context) {
    final AppState appState = ScopedModel.of<AppState>(context);

    exams = appState.exams;
    loading = appState.isLoading;
    onChangeCurrentExam = (int newValue) {
      appState.profile.poscompStatus.setExam(newValue);
    };
  }

  List<Exam> exams;
  bool loading;
  Function(int) onChangeCurrentExam;
}
