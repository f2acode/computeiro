import 'dart:convert' show json;
import 'dart:io';

import 'package:computeiro/core/services/requests/free_courses.dart';
import 'package:flutter/material.dart';

class FreeCourses extends StatelessWidget {
  Future<List> getCategories() async {
    final File savedFile = await fetchData(
      'https://raw.githubusercontent.com/Leocardoso94/Free-Courses/master/src/data/categories.ts',
      'categories.ts',
    );

    String rawJson = await savedFile.readAsString();

    String categoriesSection = rawJson.split('const')[1];

    int firstIndex = categoriesSection.indexOf('{');
    int lastIndex = categoriesSection.lastIndexOf('}');

    categoriesSection = categoriesSection.substring(firstIndex, lastIndex);
    categoriesSection = categoriesSection
        .replaceAll('title:', '"title":')
        .replaceAll('icon:', '"icon":')
        .replaceAll('iconColor:', '"iconColor":');

    categoriesSection = categoriesSection.split('},').map((s) {
      if (s.contains('\'')) {
        return '{';
      }

      final int lastComma = s.lastIndexOf(',');

      return s.substring(0, lastComma);
    }).join('\n},');

    Map x = json.decode('{"categories" : [$categoriesSection}]}');

    return x['categories'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategories(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          );

        List categories = snapshot.data;

        return Scaffold(
          body: ListView(
            children: categories
                .map(
                  (dynamic c) => ListTile(
                    title: Text(c['title']),
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/category-course',
                      arguments: c['title'],
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
