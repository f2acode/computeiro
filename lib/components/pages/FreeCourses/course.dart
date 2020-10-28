import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map course = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              course['title'],
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Text(
              'Autor: ${course['author']}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              '${course['description']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Linguagem: ${course['language']}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Nível: ${course['level']}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () => launch(course['link']),
              child: Text('Ver'),
            ),
          ],
        ),
      ),
    );
  }
}
