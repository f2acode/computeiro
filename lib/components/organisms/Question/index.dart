import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:computeiro/core/constants/index.dart';

class Question extends StatelessWidget {
  Question({
    this.questionText,
    this.questionIndex,
    this.alternatives,
    this.questionAlternatives,
    this.onPreviousQuestion,
    this.onNextQuestion,
    this.currentAnswer,
    this.onSelectAlternativeAction,
  });

  final String questionText, currentAnswer;
  final int questionIndex;
  final List<String> alternatives, questionAlternatives;
  final Function onSelectAlternativeAction;
  final Function onPreviousQuestion;
  final Function onNextQuestion;

  final List<Widget> content = <Widget>[];

  List<Widget> buildActions() {
    final List<Widget> actions = <Widget>[];

    if (questionIndex > 0) {
      actions.add(
        Container(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: RaisedButton(
            child: const Text(previousQuestion),
            onPressed: onPreviousQuestion,
          ),
        ),
      );
    }
    actions.add(
      Container(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: RaisedButton(
          child: const Text(finishExam),
          onPressed: () => print('TERMINAR'),
        ),
      ),
    );

    actions.add(
      Container(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: RaisedButton(
          child: const Text(nextQuestion),
          onPressed: onNextQuestion,
        ),
      ),
    );

    return actions;
  }

  Widget buildAlternative(String altValue, String altText) {
    return Row(
      children: <Widget>[
        Radio<String>(
          value: altValue,
          groupValue: currentAnswer,
          onChanged: (String alternative) =>
              onSelectAlternativeAction(alternative),
        ),
        Text(altText),
      ],
    );
  }

  List<Widget> buildQuestion() {
    final List<Widget> content = <Widget>[];

    content.add(MarkdownBody(data: questionText));

    for (int i = 0; i < alternatives.length; i++) {
      content.add(
        buildAlternative(
          alternatives[i],
          questionAlternatives[i],
        ),
      );
    }

    content.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildActions(),
      ),
    );

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: buildQuestion(),
    );
  }
}
