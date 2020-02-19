import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mercantis_flutter/widgets/reusable_card.dart';
import 'package:mercantis_flutter/widgets/icon_content.dart';
import 'package:mercantis_flutter/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCinzaBrancoBackground,
      appBar: AppBar(
        iconTheme:
            new IconThemeData(color: kVermelhoBase, opacity: 1, size: 40),
        elevation: 5.0,
        backgroundColor: kBranco, //kActiveBackgroundBar
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Mercantis Mobile',
                style: TextStyle(
                  fontSize: 30.0,
                  color: kVermelhoBase,
                  fontFamily: 'Oswald',
                ),
              ),
              Image(
                image: AssetImage('images/mercantis.png'),
                height: 39.0,
                width: 39.0,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    //TODO: fazer animação de clique
                    onTap: () {
                      Navigator.pushNamed(context, '/cliente');
                    },
                    child: ReusableCard(
                      colour1: Color(0xFFFFFFFF),
                      colour2: Color(0xFFFFFFFF),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person_outline,
                            size: 70.0,
                            color: Color(0xFF3A3A3A),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'CLIENTES',
                            style: TextStyle(
                              //TODO: mudar as fontes do app
                              fontSize: 15.0,
                              color: Color(0xFF3A3A3A),
                              fontFamily: 'OpenSansCondensedBold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/favoritos');
                    },
                    child: ReusableCard(
                      colour1: kVermelhoBase,
                      colour2: kVermelhoBase,
                      cardChild: IconContent(
                        icon: Icons.star_border,
                        label: 'FAVORITOS',
                        sizeText: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/vendas');
                    },
                    child: ReusableCard(
                      colour1: kVermelhoBase,
                      colour2: kVermelhoBase,
                      cardChild: IconContent(
                        icon: Icons.assignment_turned_in,
                        label: 'LIBERAR VENDAS',
                        sizeText: 15.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/compras');
                    },
                    child: ReusableCard(
                      colour1: kVermelhoBase,
                      colour2: kVermelhoBase,
                      cardChild: IconContent(
                        icon: Icons.attach_money,
                        label: 'AUTORIZAR COMPRAS',
                        sizeText: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    child: ReusableCard(
                      colour1: kVermelhoBase,
                      colour2: kVermelhoBase,
                      cardChild: IconContent(
                        icon: Icons.dashboard,
                        label: 'DASHBOARD',
                        sizeText: 15.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/suporte');
                    },
                    child: ReusableCard(
                      colour1: Color(0xFFFFFFFF),
                      colour2: Color(0xFFFFFFFF),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('images/logotanis.png'),
                            height: 120.0,
                            width: 120.0,
                          ),
                          Text(
                            'SUPORTE',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Color(0xFF3A3A3A),
                              fontFamily: 'OpenSansCondensedBold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              //TODO: tirar o padding entre o icone e o titulo
              //TODO: mudar IconSize
              //https://inducesmile.com/google-flutter/how-to-change-the-drawer-hamburger-icon-color-in-flutter/
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      'Mercantis Mobile',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 55.0,
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: kVermelhoBase,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text(
                      'Clientes',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kVermelhoBase,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/cliente');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.star_border),
                    title: Text(
                      'Favoritos',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kCinzaEscuro,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/favoritos');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.do_not_disturb),
                    title: Text(
                      'Vendas Não Liberadas',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kCinzaEscuro,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/vendas');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.event_busy),
                    title: Text(
                      'Compras Não Autorizadas',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kCinzaEscuro,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/compras');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kCinzaEscuro,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Row(
                      children: <Widget>[
                        Text(
                          'Suporte',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: kCinzaEscuro,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/suporte');
                    },
                  ),
                ],
              ),
            ),
            Container(
              // This align moves the children to the bottom
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                // This container holds all the children that will be aligned
                // on the bottom and should not scroll with the above ListView
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Divider(),
                      //ListTile(
                      // leading: Icon(Icons.settings),
                      //title: Text('Configurações'),
                      //onTap: () {
                      // Navigator.pushNamed(context, '/suporte');
                      // },
                      //),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text(
                          'Sair',
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                      Divider(),
                      Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          child: Text(
                            "V1.0.0",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}