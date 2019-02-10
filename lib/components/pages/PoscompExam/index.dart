import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/components/pages/PoscompExam/view_model.dart';

class PoscompExam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Prova do ano de ${vm.examYear}'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MarkdownBody(data: vm.questionText),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'A',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    Text('Carnivore')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'B',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    Text('Carnivore')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'C',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    Text('Carnivore')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'D',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    Text('Carnivore')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: 'E',
                      groupValue: vm.currentAnswer,
                      onChanged: (String alternative) =>
                          vm.onSelectAlternativeAction(alternative),
                    ),
                    Text('Carnivore')
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
