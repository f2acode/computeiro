import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/components/pages/PoscompExam/view_model.dart';
import 'package:computeiro/core/constants/strings.dart';

class PoscompExam extends StatelessWidget {
  Widget buildAlternative(ViewModel vm, String altValue, String altText) {
    return Row(
      children: <Widget>[
        Radio<String>(
          value: altValue,
          groupValue: vm.currentAnswer,
          onChanged: (String alternative) =>
              vm.onSelectAlternativeAction(alternative),
        ),
        Text(altText),
      ],
    );
  }

  List<Widget> buildQuestion(ViewModel vm) {
    final List<String> alternatives = <String>['A', 'B', 'C', 'D', 'E'];
    final List<Widget> content = <Widget>[];

    content.add(MarkdownBody(data: vm.questionText));

    for (int i = 0; i < alternatives.length; i++) {
      content.add(buildAlternative(
        vm,
        alternatives[i],
        vm.questionAlternatives[i],
      ));
    }

    content.add(Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: RaisedButton(
            child: const Text(previousQuestion),
            onPressed: vm.onPreviousQuestion,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: RaisedButton(
            child: const Text(finishExam),
            onPressed: () => print('TERMINAR'),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: RaisedButton(
            child: const Text(nextQuestion),
            onPressed: vm.onNextQuestion,
          ),
        ),
      ],
    ));

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget child, AppState appState) {
        final ViewModel vm = ViewModel(ctx);
        return Scaffold(
          appBar: AppBar(
            title: Text(poscompExamYear(vm.examYear.toString())),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: buildQuestion(vm),
            ),
          ),
        );
      },
    );
  }
}
