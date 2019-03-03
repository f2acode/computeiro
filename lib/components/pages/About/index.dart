import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:computeiro/core/constants/index.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const MarkdownBody(
        data: aboutMe,
      ),
    );
  }
}
