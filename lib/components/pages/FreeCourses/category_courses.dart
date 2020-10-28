import 'dart:convert' show json;
import 'dart:io';

import 'package:computeiro/core/services/requests/free_courses.dart';
import 'package:flutter/material.dart';

class CategoryCourses extends StatelessWidget {
  Future<List> getCourses(String category) async {
    final File savedFile = await fetchData(
      'https://raw.githubusercontent.com/Leocardoso94/Free-Courses/master/src/data/courses.ts',
      'courses.ts',
    );

    String rawJson = await savedFile.readAsString();

    String coursesSection = rawJson.split('const')[1].split('map')[0];

    int firstIndex = coursesSection.indexOf('{');
    int lastIndex = coursesSection.lastIndexOf('}');

    coursesSection = coursesSection.substring(firstIndex, lastIndex);
    coursesSection = coursesSection
        .replaceAll('title:', '"title":')
        .replaceAll('description:', '"description":')
        .replaceAll('link:', '"link":')
        .replaceAll('author:', '"author":')
        .replaceAll('level:', '"level":')
        .replaceAll('categories:', '"categories":')
        .replaceAll('language:', '"language":')
        .replaceAll('image:', '"image":')
        .replaceAll('flags:', '"flags":')
        .replaceAll('id:', '"id":');

    coursesSection = coursesSection.split('},').map((s) {
      if (s.contains('\'')) {
        return '{';
      }

      final int lastComma = s.lastIndexOf(',');

      return s.substring(0, lastComma);
    }).join('\n},');

    Map x = json.decode('{"courses" : [$coursesSection}]}');

    List courses = x['courses'];

    courses = courses
        .where((dynamic c) => c['title'] != null && !(c['categories'] is List))
        .toList();

    courses = courses
        .where((dynamic c) => c['categories'].split(',').contains(category))
        .toList();

    return courses;
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
              'Cursos $category',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: courses
                .map(
                  (dynamic c) => ListTile(
                    title: Text(c['title']),
                    subtitle: Text(c['author']),
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/course',
                      arguments: c,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
