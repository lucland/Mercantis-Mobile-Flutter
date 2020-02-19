import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercantis_flutter/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SuporteScreen extends StatefulWidget {
  @override
  _SuporteScreenState createState() => _SuporteScreenState();
}

class _SuporteScreenState extends State<SuporteScreen> {
  _launchURL() async {
    const url = 'https://tanis.com.br/fale-conosco/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchEmail() async {
    const url =
        'contato@tanis.com.br?subject=Ticket Mercantis Mobile&body=Olá! Gostaria de relatar um problema:';
    if (await canLaunch("mailto:$url")) {
      await launch("mailto:$url");
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kVermelhoGradiente, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: Color(0xFFE8E8E8),
        title: Text(
          'Suporte',
          style: TextStyle(
            fontSize: 20.0,
            color: kVermelhoBase,
            fontFamily: 'Oswald',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('images/logotanis.png'),
            height: 250.0,
            width: 250.0,
          ),
          SizedBox(height: 55.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10.0),
              color: kVermelhoBase,
              child: MaterialButton(
                height: 20,
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: _launchEmail,
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.mail,
                        color: kBranco,
                      ),
                      new Text('Abrir Ticket',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Oswald', fontSize: 20.0)
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10.0),
              color: kVermelhoBase,
              child: MaterialButton(
                height: 20,
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: _launchURL,
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.web,
                        color: kBranco,
                      ),
                      new Text('Site Tanis Tecnologia',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Oswald', fontSize: 20.0)
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
