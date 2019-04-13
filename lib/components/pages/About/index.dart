import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AdmobBanner(
            adUnitId: 'ca-app-pub-5728986947581808/7839721877',
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic> args) {
              switch (event) {
                case AdmobAdEvent.loaded:
                  print('Admob banner loaded!');
                  break;

                case AdmobAdEvent.opened:
                  print('Admob banner opened!');
                  break;

                case AdmobAdEvent.closed:
                  print('Admob banner closed!');
                  break;

                case AdmobAdEvent.failedToLoad:
                  print(
                      'Admob banner failed to load. Error code: ${args['errorCode']}');
                  break;
                default:
                  print('OTHER THING HAPPENED');
              }
            }),
        Container(
          height: 300,
          width: double.infinity,
          child: const Markdown(
            data: '''
            Olá!! Obrigado por baixar meu app, espero que ele te ajude nos estudos!
            Ele não possui nenhum anúncio (apenas esse acima).

            Caso queira contribuir é só clicar no anúncio :)
            ''',
          ),
        )
      ],
    );
  }
}
