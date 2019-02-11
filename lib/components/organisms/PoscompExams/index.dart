import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:computeiro/store/models/index.dart';
import 'package:computeiro/components/pages/index.dart';
import 'package:computeiro/components/organisms/PoscompExams/view_model.dart';

class PoscompExams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: vm.poscomp.exams.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          'POSCOMP ${vm.poscomp.exams[index].year.toString()}'),
                      subtitle: Text('Inserção das provas em andamento'),
                      leading: Icon(Icons.computer),
                      onTap: () {
                        vm.onChangeCurrentExam(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PoscompExam()),
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
