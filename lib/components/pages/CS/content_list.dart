import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ContentList extends StatelessWidget {
  Future<List> getCourses(String category) async {
    try {
      var rawCourses = await rootBundle.loadString(
        'assets/data/cs_content.json',
      );

      List courses = json.decode(rawCourses)['contents'];

      courses = courses
          .where((dynamic c) => c['categories'].split(',').contains(category))
          .toList();

      return courses;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final String category = ModalRoute.of(context).settings.arguments;

    return FutureBuilder(
      future: getCourses(category),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          );

        List courses = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              category,
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            centerTitle: true,
          ),
          body: Container(
            alignment: Alignment.center,
            padding: courses.isNotEmpty
                ? null
                : EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: courses.isNotEmpty
                  ? courses
                      .map(
                        (dynamic c) => ListTile(
                          title: Text(c['title']),
                          subtitle: Text(c['author']),
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/content',
                            arguments: c,
                          ),
                        ),
                      )
                      .toList()
                  : [
                      Text(
                        'Sem cursos nessa categoria',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Tente novamente mais tarde',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      SvgPicture.asset(
                        'assets/figures/warning.svg',
                        semanticsLabel: 'warning',
                        height: 200,
                      )
                    ],
            ),
          ),
        );
      },
    );
  }
}
