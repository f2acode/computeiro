import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/components/pages/FinishExamOverview/view_model.dart';

class FinishExamOverview extends StatelessWidget {
  List<Widget> generateAnswers(
    List<bool> uAnswersResult,
    List<dynamic> uAnswers,
  ) {
    final List<Widget> visualAnswers = <Widget>[];

    for (int i = 0; i < uAnswers.length - 1; i++) {
      if (uAnswersResult[i]) {
        visualAnswers.add(
          Chip(
            backgroundColor: Colors.green,
            avatar: CircleAvatar(
              child: Text('$i'),
            ),
            label: Text(
              '${uAnswers[i]}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      } else {
        visualAnswers.add(
          Chip(
            backgroundColor: Colors.red,
            avatar: CircleAvatar(
              child: Text('$i'),
            ),
            label: Text(
              '${uAnswers[i]}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }
    }

    return visualAnswers;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget child, AppState appState) {
        final ViewModel vm = ViewModel(ctx);
        return Scaffold(
          appBar: AppBar(title: const Text('Panorama geral')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: generateAnswers(vm.uAnswersResult, vm.uAnswers),
              ),
              Text(
                'Acertos/total: ${vm.hits}/${vm.total}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                'Porcentagem: ${vm.percentage.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              //Text('${vm.userHits.where((bool h) => h == false)}'),
            ],
          ),
        );
      },
    );
  }
}
