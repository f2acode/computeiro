import 'dart:convert' show json;
import 'dart:io';

import 'package:computeiro/core/services/requests/free_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FreeCourses extends StatelessWidget {
  Future<List> getCategories() async {
    try {
      final File savedFile = await fetchData(
        link:
            'https://raw.githubusercontent.com/Leocardoso94/Free-Courses/master/src/data/categories.ts',
        fileName: 'categories.ts',
        isDownloadVisible: false,
        replace: false,
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
    } catch (e) {
      return [];
    }
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
          body: Container(
            alignment: Alignment.center,
            padding: categories.isNotEmpty
                ? null
                : EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              shrinkWrap: true,
              children: categories.isNotEmpty
                  ? categories
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
                      .toList()
                  : [
                      Text(
                        'Cursos indisponíveis no momento',
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
