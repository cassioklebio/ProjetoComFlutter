

import 'package:flutter/material.dart';
import 'package:market_place/layout.dart';
import 'package:market_place/pages/about.dart';
import 'package:market_place/pages/home.dart';
import 'package:market_place/pages/list.dart';
import 'package:market_place/pages/settings.dart';

void main() => runApp(Marketplace());


class Marketplace extends StatelessWidget{

  

  final routes = <String, WidgetBuilder> {
    HomePage.tag: (context) => HomePage(),
    AboutPage.tag: (context) => AboutPage(),
    SettingsPage.tag: (context) => SettingsPage(),
    ListPage.tag: (context) => ListPage()
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
           headline: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
           title: TextStyle(fontSize: 36, fontStyle: FontStyle.italic, color: Layout.primary()),
           body1: TextStyle(fontSize: 14)
         )
      ), 
      home: HomePage(),
      routes: routes,

    );
  }


}
