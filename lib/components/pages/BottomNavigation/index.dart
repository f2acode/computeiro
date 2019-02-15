import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:computeiro/store/models/app_state.dart';
import 'package:computeiro/components/organisms/index.dart';
import 'package:computeiro/components/pages/BottomNavigation/texts.dart';
import 'package:computeiro/components/pages/BottomNavigation/view_model.dart';

class BottomNavigator extends StatelessWidget {
  Widget _handleWidgetOption(int index, ViewModel vm) {
    switch (index) {
      case 1:
        return PoscompExams();
      default:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(Texts.welcome),
            RaisedButton(
              child: const Text('Dumb request!!'),
              onPressed: () => vm.onDispatchTest('aa'),
            ),
            Text(vm.dumbSearch)
          ],
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (BuildContext context, ViewModel vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              Texts.appTitle,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          ),
          body: Center(
            child: _handleWidgetOption(vm.bottomNavIndex, vm),
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
