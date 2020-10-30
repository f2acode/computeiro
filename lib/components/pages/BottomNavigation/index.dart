import 'package:computeiro/components/pages/CS/index.dart';
import 'package:computeiro/components/pages/FreeCourses/index.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/components/pages/index.dart';
import 'package:computeiro/components/pages/BottomNavigation/view_model.dart';

class BottomNavigator extends StatelessWidget {
  Widget _handleWidgetOption(int index) {
    final List<Widget> possibleWidgets = <Widget>[
      CSCategories(),
      FreeCourses(),
      ExamsList(),
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
              'Computeiro',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: _handleWidgetOption(vm.bottomNavIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.computer_rounded),
                label: 'Computação',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_sharp),
                label: 'Linguagens',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grade),
                label: 'Poscomp',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.developer_mode),
                label: 'About',
              ),
            ],
            currentIndex: vm.bottomNavIndex,
            unselectedItemColor: Colors.white,
            fixedColor: Theme.of(context).accentColor,
            onTap: (int index) => vm.onChangeBottomNavIndex(index),
          ),
        );
      },
    );
  }
}
