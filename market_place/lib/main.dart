

import 'package:flutter/material.dart';
import 'package:market_place/layout.dart';
import 'package:market_place/pages/about.dart';
import 'package:market_place/pages/home.dart';
import 'package:market_place/pages/items.dart';
import 'package:market_place/pages/settings.dart';

void main() => runApp(Marketplace());


class Marketplace extends StatelessWidget{

  

  final routes = <String, WidgetBuilder> {
    HomePage.tag: (context) => HomePage(),
    AboutPage.tag: (context) => AboutPage(),
    SettingsPage.tag: (context) => SettingsPage(),
    ItemsPage.tag: (context) => ItemsPage()
   };

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Marketplace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Layout.primary(),
        accentColor: Layout.secondary(),
         textTheme: TextTheme(
           headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
           bodyText1: TextStyle(fontSize: 36, fontStyle: FontStyle.italic, color: Layout.primary()),
           bodyText2: TextStyle(fontSize: 14)
         )
      ), 
      home: HomePage(),
      routes: routes,

    );
  }


}
