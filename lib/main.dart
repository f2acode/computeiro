import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/core/style/index.dart';
import 'package:computeiro/components/pages/index.dart';

Future<void> main() async {
  FirebaseAdMob.instance.initialize(
    appId: '***REMOVED***',
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppState>(
      model: AppState.initial(),
      child: MaterialApp(
        title: 'Computeiro',
        theme: AppTheme().get(),
        home: BottomNavigator(),
      ),
    );
  }
}
