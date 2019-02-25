import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:computeiro/components/pages/BottomNavigation/texts.dart';
import 'package:computeiro/components/pages/Home/view_model.dart';
import 'package:computeiro/scoped_model/app_state.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double locale = 40;

  void swipe(DragUpdateDetails changeValue) {
    print('swiped -> ${changeValue.primaryDelta}');
    setState(() {
      locale = locale - changeValue.primaryDelta;
    });
  }

  void swipeEnd(DragEndDetails e) {}

  void swipeDown(DragDownDetails d) {
    print(d.globalPosition);
  }

  Widget renderSwipedWidget() {
    return Container(
      height: locale,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          Center(
            child: Text(
              'Movimentaćões',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Text(
            'Then here there will likely be some other content '
                'which will be displayed within the bottom bar',
            textAlign: TextAlign.left,
          ),
          Text(
            'Then here there will likely be some other content '
                'which will be displayed within the bottom bar',
            textAlign: TextAlign.left,
          ),
          Text(
            'Then here there will likely be some other content '
                'which will be displayed within the bottom bar',
            textAlign: TextAlign.left,
          ),
          Text(
            'Then here there will likely be some other content '
                'which will be displayed within the bottom bar',
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppState>(
      builder: (BuildContext ctx, Widget c, AppState s) {
        final ViewModel vm = ViewModel(ctx);
        return GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails u) => swipe(u),
          onVerticalDragDown: (DragDownDetails d) => swipeDown(d),
          //onVerticalDragEnd: (DragEndDetails e) => swipeEnd(e),
          child: Scaffold(
            bottomSheet: renderSwipedWidget(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(Texts.welcome),
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
