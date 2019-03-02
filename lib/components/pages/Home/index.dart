import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/scoped_model/app_state.dart';

import 'package:computeiro/core/constants/index.dart';

import 'package:computeiro/components/pages/Home/view_model.dart';
//import 'package:computeiro/components/organisms/SwipedModal/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // double swipedModalHeight = 40;

  // void swipe(DragUpdateDetails changeValue) {
  //   setState(() {
  //     swipedModalHeight = swipedModalHeight - changeValue.primaryDelta;
  //   });
  // }

  // void swipeEnd(DragEndDetails e) {}

  // void swipeDown(DragDownDetails d) {
  //   print(d.globalPosition);
  // }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget c, AppState s) {
        final ViewModel vm = ViewModel(ctx);
        return GestureDetector(
          // onVerticalDragUpdate: (DragUpdateDetails u) => swipe(u),
          // onVerticalDragDown: (DragDownDetails d) => swipeDown(d),
          child: Scaffold(
            // bottomSheet: SwipedModal(
            //   height: swipedModalHeight,
            // ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(welcome),
                  RaisedButton(
                    child: const Text('Dumb request!!'),
                    onPressed: () => vm.onDispatchTest(),
                  ),
                  Text(vm.resultDumbSearch),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
