import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

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

  void showAlternatives(BuildContext context) {
    showDialog<AlertDialog>(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text('Dialog Title'),
            content: const Text('This is my content'),
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

  /*
  Widget buildAlternative(String altValue, String altText, int i) {
    return ExpansionTile(
      title: Text('Alternativa $i'),
      children: <Widget>[
        Container(
          height: 50,
          child: TeXView(
            teXHTML: altText,
          ),
        ),
      ],
    );
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
  }*/

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

    /* for (int i = 0; i < alternatives.length; i++) {
      content.add(
        buildAlternative(
          alternatives[i],
          questionAlternatives[i],
          i,
        ),
      );
    } */

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
