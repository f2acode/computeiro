import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<void> _launchPrivacyPolicy() async {
    const String url = 'https://computeiro-web.herokuapp.com/';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchOpenSourceProject() async {
    const String url = 'https://github.com/f2acode/computeiro';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SvgPicture.asset(
          'assets/icon/learn.svg',
          semanticsLabel: 'learn',
          height: 200,
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('Projeto Open Source'),
          onTap: _launchOpenSourceProject,
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text('Compartilhar'),
          onTap: () {
            Share.share(
              'https://play.google.com/store/apps/details?id=me.correria.correria',
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('Dúvidas e sugestões'),
          onTap: () => launch("whatsapp://send?phone=+5511948414445"),
        ),
        ListTile(
          leading: Icon(Icons.screen_lock_portrait_outlined),
          title: Text('Política de privacidade'),
          onTap: _launchPrivacyPolicy,
        ),
      ],
    );
  }
}
