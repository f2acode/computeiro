import 'package:flutter/material.dart';

class AnswerDialog extends StatefulWidget {
  const AnswerDialog({
    this.content,
    this.alternatives,
    this.currentAnswer,
    this.onSelectAlternativeAction,
    this.onNextQuestion,
  });

  final List<Widget> content;
  final List<String> alternatives;
  final String currentAnswer;
  final Function onSelectAlternativeAction;
  final Function onNextQuestion;

  @override
  _AnswerDialogState createState() => _AnswerDialogState();
}

class _AnswerDialogState extends State<AnswerDialog> {
  String alternative;

  Widget buildAlternative(String altValue, int i) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: RaisedButton(
        child: Text(altValue),
        textColor: Theme.of(context).primaryColor,
        color: alternative == altValue ? Colors.white12 : Colors.white,
        onPressed: () {
          setState(() => alternative = altValue);
          widget.onSelectAlternativeAction(alternative);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> content = <Widget>[];

    for (int i = 0; i < widget.alternatives.length; i++) {
      content.add(
        buildAlternative(
          widget.alternatives[i],
          i,
        ),
      );
    }

    return AlertDialog(
      title: Center(
        child: const Text(
          'Selecione uma alternativa',
          style: TextStyle(fontSize: 16),
        ),
      ),
      content: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: content,
      ),
      actions: <Widget>[
        RaisedButton(
          child: const Text('Cancelar'),
          color: Colors.white,
          textColor: Theme.of(context).disabledColor,
          onPressed: () => Navigator.pop(context),
        ),
        RaisedButton(
          child: const Text('Confirmar'),
          color: Theme.of(context).accentColor,
          textColor: Colors.black,
          onPressed: () {
            widget.onNextQuestion();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
