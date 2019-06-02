import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/components/pages/index.dart';
import 'package:computeiro/components/pages/ExamsList/view_model.dart';

class ExamsList extends StatelessWidget {
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
                  itemCount: vm.exams.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      enabled: index == 0,
                      title: Text('POSCOMP ${vm.exams[index].year}'),
                      subtitle: index == 0
                          ? const Text('Novo!')
                          : const Text('Inserção das provas em andamento'),
                      leading: const Icon(Icons.computer),
                      onTap: () {
                        vm.onChangeCurrentExam(index);
                        Navigator.push<MaterialPageRoute<Exam>>(
                          context,
                          MaterialPageRoute<MaterialPageRoute<Exam>>(
                            builder: (BuildContext context) => Exam(),
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
