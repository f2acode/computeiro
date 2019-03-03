import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:computeiro/core/constants/index.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          const MarkdownBody(data: aboutMe),
          //Radius - maybe I can use it
          //Container(transform: Matrix,)
          // I can also try to draw my own
          //CustomPaint() - or just paint
          Slider(onChanged: (double v) {}, value: 0)
        ],
      ),
    );
  }
}
