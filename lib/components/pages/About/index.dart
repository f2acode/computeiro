import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:computeiro/core/constants/index.dart';

import 'package:computeiro/components/atoms/CurvedSlider/index.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  double rangeValue = 100.0;
  double currentValue = 10.0;

  void updateValue(DragUpdateDetails changeValue) {
    print(changeValue.primaryDelta);

    if (currentValue < rangeValue && changeValue.primaryDelta > 0) {
      setState(() {
        currentValue = currentValue + 1;
      });
    } else if (currentValue > 0 && changeValue.primaryDelta.isNegative) {
      setState(() {
        currentValue = currentValue - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const MarkdownBody(data: aboutMe),
          GestureDetector(
            onHorizontalDragUpdate: (DragUpdateDetails u) => updateValue(u),
            // onVerticalDragDown: (DragDownDetails d) => swipeDown(d),
            child: Container(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: CurvedSlider(
                  width: 20.0,
                  completePercent: 20,
                  lineColor: Colors.grey,
                  dotColor: Colors.red,
                  rangeValue: rangeValue,
                  currentValue: currentValue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
