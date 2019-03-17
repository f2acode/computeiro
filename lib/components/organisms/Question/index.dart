import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

import 'package:computeiro/core/constants/index.dart';

class AnswerDialog extends StatefulWidget {
  const AnswerDialog({
    this.content,
    this.alternatives,
    this.currentAnswer,
    this.onSelectAlternativeAction,
    this.questionAlternatives,
  });

  final List<Widget> content;
  final List<String> alternatives, questionAlternatives;
  final String currentAnswer;
  final Function onSelectAlternativeAction;

  @override
  _AnswerDialogState createState() => _AnswerDialogState();
}

class _AnswerDialogState extends State<AnswerDialog> {
  String alternative = 'B';

  Widget buildAlternative(String altValue, String altText, int i) {
    print(widget.currentAnswer);
    return Row(
      children: <Widget>[
        Radio<String>(
          value: altValue,
          groupValue: alternative,
          onChanged: (String a) {
            widget.onSelectAlternativeAction(alternative);
            setState(() => alternative = a);
          },
        ),
        Text(altText),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentAnswer);
    final List<Widget> content = <Widget>[];

    for (int i = 0; i < widget.alternatives.length; i++) {
      content.add(
        buildAlternative(
          widget.alternatives[i],
          widget.questionAlternatives[i],
          i,
        ),
      );
    }

    return AlertDialog(
      title: Center(
        child: const Text(
          'Selecione a alternativa',
          style: TextStyle(fontSize: 16),
        ),
      ),
      content: Column(children: content),
    );
  }
}

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

  void showAlternatives(BuildContext context) {
    showDialog<AlertDialog>(
      context: context,
      builder: (_) => AnswerDialog(
            content: content,
            alternatives: alternatives,
            currentAnswer: currentAnswer,
            onSelectAlternativeAction: onSelectAlternativeAction,
            questionAlternatives: questionAlternatives,
          ),
    );
  }

  List<Widget> buildActions(BuildContext context) {
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
          child: const Text(answerQuestion),
          onPressed: () => showAlternatives(context),
        ),
      ),
    );

    return actions;
  }

  List<Widget> buildQuestion(double height) {
    final List<Widget> content = <Widget>[];

    content.add(
      Container(
        height: height,
        child: TeXView(
          teXHTML: questionText,
        ),
      ),
    );

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: buildQuestion(MediaQuery.of(context).size.height),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildActions(context),
      ),
    );
  }
}
