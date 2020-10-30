import 'dart:convert' show json;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CSCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString('assets/data/cs_categories.json'),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          );

        List categories = json.decode(snapshot.data)['categories'];

        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: ListView(
              children: [
                ListTile(
                  title: Text('Provas e gabaritos POSCOMP'),
                  onTap: () => Navigator.pushNamed(context, '/poscomp-list'),
                ),
              ]..addAll(
                  categories.map(
                    (dynamic c) => ListTile(
                      title: Text(c['title']),
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/content-list',
                        arguments: c['title'],
                      ),
                    ),
                  ),
                ),
            ),
          ),
        );
      },
    );
  }
}
