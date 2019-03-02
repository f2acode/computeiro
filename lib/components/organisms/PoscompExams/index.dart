import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/constants/index.dart';

import 'package:computeiro/components/pages/index.dart';
import 'package:computeiro/components/organisms/PoscompExams/view_model.dart';

class PoscompExams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext context, Widget child, AppState appState) {
        final ViewModel vm = ViewModel(context);
        return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: vm.poscomp.exams.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('POSCOMP ${vm.poscomp.exams[index].year}'),
                      subtitle: const Text(insertingExams),
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
}
