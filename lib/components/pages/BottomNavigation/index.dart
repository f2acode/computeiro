import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/components/organisms/index.dart';
import 'package:computeiro/components/pages/BottomNavigation/texts.dart';
import 'package:computeiro/components/pages/BottomNavigation/view_model.dart';
import 'package:computeiro/components/pages/Home/index.dart';

class BottomNavigator extends StatelessWidget {
  Widget _handleWidgetOption(int index) {
    final List<Widget> possibleWidgets = <Widget>[
      Home(),
      poscompExams(),
    ];

    return possibleWidgets[index];
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext context, Widget child, AppState appState) {
        final ViewModel vm = ViewModel(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              Texts.appTitle,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
          body: Center(
            child: _handleWidgetOption(vm.bottomNavIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('Poscomp'),
              ),
            ],
            currentIndex: vm.bottomNavIndex,
            fixedColor: Theme.of(context).accentColor,
            onTap: (int index) => vm.onChangeBottomNavIndex(index),
          ),
        );
      },
    );
  }
}
