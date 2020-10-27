import 'package:flutter/material.dart';

class SwipedModal extends StatelessWidget {
  const SwipedModal({this.height, this.title, this.widgets});

  final double height;
  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Center(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ]..addAll(widgets),
      ),
    );
  }
}
