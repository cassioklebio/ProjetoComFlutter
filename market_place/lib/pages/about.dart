import 'package:flutter/material.dart';
import 'package:market_place/layout.dart';

class AboutPage extends StatelessWidget{

  static String tag = 'about-page';

  @override
  Widget build(BuildContext context) {
    return Layout.getContent(context, Center(
      child: Text(
        'Este app foi criando por Cássio klebio Aplicativos',
        style: TextStyle(color: Layout.primary()),
        ),
      
    ));
  }


}