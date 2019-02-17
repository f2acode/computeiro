import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/components/pages/index.dart';
import 'package:computeiro/components/organisms/PoscompExams/view_model.dart';

@widget
Widget poscompExams() {
  return StoreConnector<AppState, ViewModel>(
    converter: ViewModel.fromStore,
    builder: (BuildContext context, ViewModel vm) {
      return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: vm.poscomp.exams.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                        'POSCOMP ${vm.poscomp.exams[index].year.toString()}'),
                    subtitle: const Text('Inserção das provas em andamento'),
                    leading: const Icon(Icons.computer),
                    onTap: () {
                      vm.onChangeCurrentExam(index);
                      Navigator.push<MaterialPageRoute<PoscompExam>>(
                        context,
                        MaterialPageRoute<MaterialPageRoute<PoscompExam>>(
                          builder: (BuildContext context) => PoscompExam(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
