import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:admob_flutter/admob_flutter.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/style/index.dart';
import 'package:computeiro/core/constants/index.dart';

import 'package:computeiro/components/pages/index.dart';

Future<void> main() async {
  Admob.initialize('ca-app-pub-5728986947581808~8852586496');
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppState>(
      model: AppState.initial(),
      child: MaterialApp(
        title: appTitle,
        theme: AppTheme().get(),
        home: BottomNavigator(),
      ),
    );
  }
}
