import 'package:flutter/material.dart';

import '../layout.dart';

class ListPage extends StatefulWidget {

  static final tag = 'list-page';
  
  @override
  _ListPageState createState() => _ListPageState();
}
  
  class _ListPageState extends State<ListPage> {

    List<Widget> itemsList = List<Widget>();

    void initState(){
     
      _addNewOne();
      

      super.initState();
    }
  @override
  Widget build(BuildContext context) {

    final content = SingleChildScrollView(
      child: Column(
      children: <Widget>[
          SizedBox(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Pesquisar'
              ),
            ),
          ),
       Container(
         height: MediaQuery.of(context).size.height -250,
           child: ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (BuildContext context, int index){
              return itemsList[index];
             
            },
          ),
       ),
       FloatingActionButton(        
        onPressed: () {
              setState(() {
                _addNewOne();
              });
            },
            child: Icon(Icons.add),
            backgroundColor: Layout.primary(),
          ),
       Container(
            color: Layout.primary(),
            height: 80,
            child: Row(children: <Widget>[
              Container (
                width: MediaQuery.of(context).size.width/2,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Total de items: 1',style: TextStyle(color: Colors.white)),
                  Text('Já adquirido: 0',style: TextStyle(color: Colors.white))
                ],
              ),
              ),
              Container (
                width: MediaQuery.of(context).size.width/2,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Total: R\$ 15,00',style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
              )


            ]),
          ),
      ],
    ),
    );
    return Layout.getContent(context, content, false);
  }

  void _addNewOne() {
     itemsList.add(ListTile(
        leading: Icon(Icons.adjust, color: Layout.primary()),
        title: Text('Nome do item'),
        subtitle: Text('4 x R\$ 1.50 = R\$ 6,00'),
        trailing: GestureDetector(
          child: Icon(Icons.delete),
          onTap: (){
            print('Deletar');
          }
        ),
        onLongPress: () {
          print('Editar produto');
          
        },
      ));
  }

}