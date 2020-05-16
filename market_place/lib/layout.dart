import 'package:flutter/material.dart';
import 'package:market_place/pages/about.dart';
import 'package:market_place/pages/home.dart';
import 'package:market_place/pages/settings.dart';
import 'package:market_place/models/Lista.dart';

// import './widgets/HomeList.dart';



class Layout {

  static final pages = [
    HomePage.tag,
    AboutPage.tag,
    SettingsPage.tag
  ];


  static int currItem = 0 ;

  static Scaffold getContent(BuildContext context, content, [bool showbotton = true]) {

   BottomNavigationBar bottomNavBar = BottomNavigationBar(
      currentIndex: currItem,
        fixedColor: primary(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.reorder),title: Text('Sobre')),
          BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text('Configurações')
          )          

        ],
        onTap: (int i){
          currItem = i;
          Navigator.of(context).pushReplacementNamed(pages[i]);
        },  
   );

  


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Layout.primary(),
        title: Center(
          child: Text('Marketplace'),
        ),
        actions: showbotton ? _getActions(context) : [],
      ),
      bottomNavigationBar: showbotton ? bottomNavBar : null ,
      body: content,
    );
  }

  static List<Widget> _getActions(BuildContext context){

     TextEditingController _c = TextEditingController();

    List<Widget> items = List<Widget>();

    //Fora da paigna home não mostra acao alguma
    if(pages[currItem] == HomePage.tag){
      items.add(
         GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                //barrierDismissible: false,
                builder: (BuildContext ctx){

                  final input = TextFormField(
                    controller: _c,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Nome',
                     // contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                     // border: OutlineInputBorder(
                       // borderRadius: BorderRadius.circular(10)
                     // )


                    ),
                  );

                  return AlertDialog(
                    title: Text('Nome da Lista', style: TextStyle(fontSize: 20),),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          //Text('Nome'),
                          input
                        ],
                    ),
                    ),
                    actions: <Widget>[
                      RaisedButton(
                        color: Layout.primary(),
                        child: Text('Cancelar ', style: TextStyle(fontSize: 12, color: Layout.write())),
                        onPressed: (){
                          Navigator.of(ctx).pop();
                        }
                      ),
                      RaisedButton(
                        color: Layout.primary(),
                        child: Text('Adicionar ', style: TextStyle(fontSize: 12, color: Layout.write())),
                        onPressed: (){

                          Lista listaBO = Lista();
                          listaBO.insert({
                            'name': _c.text,
                            'created': DateTime.now().toString()
                          }).then((newRowId){

                            Navigator.of(ctx).pop();
                            Navigator.of(ctx).pushReplacementNamed(HomePage.tag);
                          });
                        }
                      ),
                    ],
                  );
                }
              );
            },
            child: Icon(Icons.add),
          )
        );

    }
    

    
        items.add(Padding(padding: EdgeInsets.only(right:20)));

    return items;

  }


  static Color primary([double opacity = 1 ]) => Color.fromRGBO(255, 0, 0, opacity);
  static Color secondary([double opacity = 1]) => Color.fromRGBO(255,99,71, opacity);
  static Color light([double opacity = 1])=> Color.fromRGBO(255, 250, 250, opacity);
  static Color dark([double opacity = 1]) => Color.fromRGBO(51, 51, 51, opacity);
  static Color write([double opacity = 1]) => Color.fromRGBO(255, 250, 250, opacity);
   


  static Color danger([double opacity = 1])=> Color.fromRGBO(250, 128, 114, opacity);
  static Color success([double opacity = 1]) => Color.fromRGBO(6, 166, 59, opacity);
  static Color info([double opacity = 1]) => Color.fromRGBO(0, 122, 166, opacity);
  static Color warning([double opacity = 1]) => Color.fromRGBO(166, 134, 0, opacity);



}