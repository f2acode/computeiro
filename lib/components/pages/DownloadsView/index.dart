import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/core/models/Exam/asset.dart';
import 'package:computeiro/core/models/index.dart';
import 'package:computeiro/components/pages/DownloadsView/view_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String taskId;

  Future<String> _findLocalPath() async {
    final Directory directory = await getExternalStorageDirectory();
    return directory.path;
  }

  Future<bool> _checkPermission() async {
    final PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    if (permission != PermissionStatus.granted) {
      final Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler().requestPermissions(
        <PermissionGroup>[PermissionGroup.storage],
      );

      if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> fetchPost(String link) async {
    final String localPath = (await _findLocalPath()) + '/Download';

    final Directory savedDir = Directory(localPath);
    final bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    taskId = await FlutterDownloader.enqueue(
      url: link,
      savedDir: localPath,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

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
                          trailing: RaisedButton(
                            child: const Text('Baixar'),
                            onPressed: () {
                              _checkPermission().then((dynamic hasGranted) {
                                if (hasGranted) {
                                  fetchPost(assets[index].link);
                                }
                              });
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
