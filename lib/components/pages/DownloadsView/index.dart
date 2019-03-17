import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/constants/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> examFiles = <String>['POSCOMP 2017', 'POSCOMP 2018'];
  String taskId;

  Future<String> _findLocalPath() async {
    final directory = await getExternalStorageDirectory();
    /* widget.platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory(); */
    return directory.path;
  }

  Future<bool> _checkPermission() async {
    //if (widget.platform == TargetPlatform.android) {
    final PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      final Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
        return true;
      }
    } else {
      return true;
    }
    /* } else {
      return true;
    } */
    return false;
  }

  Future<void> fetchPost() async {
    String localPath = (await _findLocalPath()) + '/Download';

    taskId = await FlutterDownloader.enqueue(
      url:
          'https://github.com/amimaro/Provas-POSCOMP/raw/master/2018/caderno_2018.pdf',
      savedDir: localPath,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget c, AppState s) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: examFiles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(examFiles[index]),
                      leading: const Icon(Icons.insert_drive_file),
                      onTap: () {
                        _checkPermission().then((dynamic hasGranted) {
                          if (hasGranted) {
                            fetchPost();
                          }
                        });
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
