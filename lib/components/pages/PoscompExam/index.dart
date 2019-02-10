import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
            title: Text(
                'Prova do ano de ${vm.poscomp.exams[vm.profile.poscompStatus.exam].year}'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Text('Que os jogos comecem!')),
              ],
            ),
          ),
        );
      },
    );
  }
}
