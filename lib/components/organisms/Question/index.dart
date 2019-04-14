import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:computeiro/components/organisms/index.dart';

class Question extends StatelessWidget {
  Question({
    this.questionText,
    this.questionIndex,
    this.alternatives,
    this.onPreviousQuestion,
    this.onNextQuestion,
    this.currentAnswer,
    this.onSelectAlternativeAction,
  });

  final String questionText, currentAnswer;
  final int questionIndex;
  final List<String> alternatives;
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
            onNextQuestion: onNextQuestion,
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
            child: const Text('Anterior'),
            onPressed: onPreviousQuestion,
          ),
        ),
      );
    }
    actions.add(
      Container(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: RaisedButton(
          child: const Text('Terminar'),
          onPressed: () => print('Terminar'),
        ),
      ),
    );

    actions.add(
      Container(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: RaisedButton(
          child: const Text('Responder'),
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
          key: Key(questionText),
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
