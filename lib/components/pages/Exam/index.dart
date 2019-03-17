import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/constants/index.dart';

import 'package:computeiro/components/organisms/index.dart';
import 'package:computeiro/components/pages/Exam/view_model.dart';

class Exam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget child, AppState appState) {
        final ViewModel vm = ViewModel(ctx);
        return Scaffold(
          appBar: AppBar(
            title: Text(poscompExamYear(vm.examYear.toString())),
          ),
          body: Question(
            questionText: vm.questionText,
            questionIndex: vm.questionIndex,
            currentAnswer: vm.currentAnswer,
            alternatives: const <String>['A', 'B', 'C', 'D', 'E'],
            onSelectAlternativeAction: vm.onSelectAlternativeAction,
            onNextQuestion: vm.onNextQuestion,
            onPreviousQuestion: vm.onPreviousQuestion,
          ),
        );
      },
    );
  }
}
