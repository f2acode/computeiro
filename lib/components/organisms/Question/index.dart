import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:computeiro/components/organisms/index.dart';
import 'package:computeiro/components/pages/index.dart';

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

  void showAlternatives(BuildContext ctx) {
    showDialog<AlertDialog>(
      context: ctx,
      builder: (_) => AnswerDialog(
        content: content,
        alternatives: alternatives,
        currentAnswer: currentAnswer,
        onSelectAlternativeAction: onSelectAlternativeAction,
        onNextQuestion: onNextQuestion,
      ),
    );
  }

  void finishExam(BuildContext ctx) {
    Navigator.push<MaterialPageRoute<FinishExamOverview>>(
      ctx,
      MaterialPageRoute<MaterialPageRoute<FinishExamOverview>>(
        builder: (BuildContext context) => FinishExamOverview(),
      ),
    );
  }

  List<Widget> buildActions(BuildContext ctx) {
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
          onPressed: () => finishExam(ctx),
        ),
      ),
    );

    actions.add(
      Container(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: RaisedButton(
          child: const Text('Responder'),
          onPressed: () => showAlternatives(ctx),
        ),
      ),
    );

    return actions;
  }

  List<Widget> buildQuestion(double height) {
    final List<Widget> content = <Widget>[];

    content.add(
      Container(
        padding: const EdgeInsets.all(20),
        height: height,
        child: TeXView(
          key: Key(questionText),
          child: TeXViewColumn(
            children: <TeXViewDocument>[
              TeXViewDocument(questionText),
            ],
          ),
        ),
      ),
    );

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
