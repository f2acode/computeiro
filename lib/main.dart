import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:computeiro/scoped_model/app_state.dart';
import 'package:computeiro/core/style/index.dart';
import 'package:computeiro/components/pages/index.dart';

import 'components/pages/FreeCourses/category_courses.dart';
import 'components/pages/FreeCourses/course.dart';

Future<void> main() async {
  await FlutterDownloader.initialize();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precachePicture(
      SvgPicture.asset(
        "assets/figures/learn.svg",
        semanticsLabel: 'learn',
      ).pictureProvider,
      context,
    );

    precachePicture(
      SvgPicture.asset(
        'assets/figures/warning.svg',
        semanticsLabel: 'warning',
        height: 200,
      ).pictureProvider,
      context,
    );

    return ScopedModel<AppState>(
      model: AppState.initial(),
      child: MaterialApp(
        title: 'Computeiro',
        theme: AppTheme().get(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (BuildContext context) => BottomNavigator(),
          '/category-course': (BuildContext context) => CategoryCourses(),
          '/course': (BuildContext context) => Course(),
        },
      ),
    );
  }
}
