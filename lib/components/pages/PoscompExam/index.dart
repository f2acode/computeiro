import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/components/pages/PoscompExam/view_model.dart';

class PoscompExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget child, AppState appState) {
        final ViewModel vm = ViewModel(ctx);
        return Scaffold(
          appBar: AppBar(
            title: Text('Prova do ano de ${vm.examYear}'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MarkdownBody(data: vm.questionText),
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: 'A',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    const Text('Carnivore')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: 'B',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    const Text('Carnivore')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: 'C',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    const Text('Carnivore')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: 'D',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    const Text('Carnivore')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: 'E',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    const Text('Carnivore')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: RaisedButton(
                        child: const Text('VOLTAR'),
                        onPressed: vm.onPreviousQuestion,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: RaisedButton(
                        child: const Text('TERMINAR'),
                        onPressed: () => print('TERMINAR'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 5, left: 5),
                      child: RaisedButton(
                        child: const Text('PRÓXIMA'),
                        onPressed: vm.onNextQuestion,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
