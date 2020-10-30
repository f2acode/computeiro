import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map content = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              content['title'],
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Text(
              'Autor: ${content['author']}',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              '${content['description']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Linguagem: ${content['language']}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Nível: ${content['level']}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () => launch(content['link']),
              child: Text('Ver'),
            ),
          ],
        ),
      ),
    );
  }
}
