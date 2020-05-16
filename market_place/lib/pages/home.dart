import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_place/layout.dart';
import 'package:market_place/models/Lista.dart';
import '../widgets/HomeList.dart';

class HomePage extends StatefulWidget{

  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Lista listaBO = Lista();

  @override
  Widget build(BuildContext context) {
   // 
    final  content = FutureBuilder(
      future: listaBO.list(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(child: Text('Carregando...'));
          
          default:
            if(snapshot.hasError){
              print(snapshot.error);
              return Text('Error:  ${snapshot.error}');
            }else {
              return HomeList(items: snapshot.data);
            }
        
        }
    });


    return Layout.getContent(context, content);
  }
}