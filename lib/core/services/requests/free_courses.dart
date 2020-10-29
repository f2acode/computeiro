import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';

Future<String> _findLocalPath() async {
  final Directory directory = await getExternalStorageDirectory();
  return directory.path;
}

Future<bool> _checkPermission() async {
  final PermissionStatus status = await Permission.storage.status;

  if (status != PermissionStatus.granted) {
    final PermissionStatus granted = await Permission.storage.request();

    return granted == PermissionStatus.granted;
  }
  return true;
}

Future<File> fetchData({
  String link,
  String fileName,
  bool isDownloadVisible,
  bool replace = true,
}) async {
  if (!await _checkPermission()) return null;

  final String localPath = (await _findLocalPath()) + '/Download';

  final Directory savedDir = Directory(localPath);
  final bool hasExisted = savedDir.existsSync();
  if (!hasExisted) {
    await savedDir.create();
  }

  File savedFile = File(savedDir.path + '/$fileName');

  if (!replace && savedFile.existsSync()) {
    return savedFile;
  }

  if (isDownloadVisible)
    await FlutterDownloader.enqueue(
      url: link,
      savedDir: localPath,
      showNotification: true,
      openFileFromNotification: true,
    );
  else
    await Dio().download(link, savedFile.path);

  return savedFile;
}
