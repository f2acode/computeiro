import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<void> _launchURL() async {
    const String url = 'https://computeiro-web.herokuapp.com/';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          child: const Markdown(
            data: '''
            Olá!! Obrigado por baixar o app, espero que ele te ajude nos estudos!
            Ele não possui nenhum anúncio.
            ''',
          ),
        ),
        RaisedButton(
          onPressed: _launchURL,
          child: const Text('Ver Política de Privacidade'),
        ),
      ],
    );
  }
}
