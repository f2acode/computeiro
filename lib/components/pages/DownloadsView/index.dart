import 'package:computeiro/components/pages/DownloadsView/view_model.dart';
import 'package:computeiro/core/models/Exam/asset.dart';
import 'package:computeiro/core/models/index.dart';
import 'package:computeiro/core/services/requests/free_courses.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget c, AppState s) {
        final ViewModel vm = ViewModel(context);
        final List<Asset> assets = <Asset>[];

        for (Exam e in vm.exams) {
          assets.addAll(e.assets.map((Asset a) => a));
        }

        return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: assets.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String title = assets[index].title;
                    final bool isExam = title.substring(0, 5) == 'Prova';
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ListTile(
                          title: Text(title),
                          leading: Icon(
                            isExam
                                ? Icons.insert_drive_file
                                : Icons.filter_tilt_shift,
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.download_rounded),
                            onPressed: () async {
                              await fetchData(
                                link: assets[index].link,
                                fileName: 'categories.ts',
                                isDownloadVisible: true,
                              );
                            },
                          ),
                        ),
                      ),
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
