import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:computeiro/components/pages/PoscompExams/index.dart';
import 'package:computeiro/store/models/app_state.dart';
import 'package:computeiro/components/orgasnisms/BottomNavigation/view_model.dart';

class BottomNavigator extends StatelessWidget {
  final _widgetOptions = [
    Text('Index 0: Hozme'),
    PoscompExams(),
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BottomNavigationBar Sample'),
          ),
          body: Center(
            child: _widgetOptions.elementAt(vm.bottomNavIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.school), title: Text('Poscomp')),
            ],
            currentIndex: vm.bottomNavIndex,
            fixedColor: Colors.deepPurple,
            onTap: (int index) {
              vm.onChangeBottomNavIndex(index);
            },
          ),
        );
      },
    );
  }
}
