import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/constants/index.dart';

import 'package:computeiro/components/organisms/index.dart';
import 'package:computeiro/components/pages/index.dart';
import 'package:computeiro/components/pages/BottomNavigation/view_model.dart';

class BottomNavigator extends StatelessWidget {
  Widget _handleWidgetOption(int index) {
    final List<Widget> possibleWidgets = <Widget>[
      Home(),
      PoscompExams(),
      About(),
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
              appTitle,
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
                title: Text(home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text(poscomp),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.developer_mode),
                title: Text(about),
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
