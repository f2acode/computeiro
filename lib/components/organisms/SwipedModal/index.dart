import 'package:flutter/material.dart';

class SwipedModal extends StatelessWidget {
  const SwipedModal({this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          Center(
            child: Text(
              'Movimentações',
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
}
