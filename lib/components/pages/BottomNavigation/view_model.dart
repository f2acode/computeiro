import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:computeiro/scoped_model/app_state.dart';

class ViewModel {
  ViewModel(BuildContext context) {
    final AppState appState = ScopedModel.of<AppState>(context);
    bottomNavIndex = appState.bottomNavIndex;
    onChangeBottomNavIndex = (int newValue) {
      appState.setBottomNavIndex(newValue);
    };
  }

  int bottomNavIndex;
  Function(int) onChangeBottomNavIndex;
}
