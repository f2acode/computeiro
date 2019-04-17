import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-5728986947581808/7839721877',
    size: AdSize.smartBanner,
    listener: (MobileAdEvent event) {
      print('BannerAd event is $event');
    },
  );

  @override
  void initState() {
    super.initState();
    myBanner
      ..load()
      ..show(
        anchorOffset: 60.0,
        anchorType: AnchorType.bottom,
      );
  }

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
            Olá!! Obrigado por baixar meu app, espero que ele te ajude nos estudos!
            Ele não possui nenhum anúncio (apenas esse acima).

            Caso queira contribuir é só clicar no anúncio :)
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
