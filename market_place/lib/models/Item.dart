import 'package:market_place/models/AbstractModel.dart';
import 'package:market_place/application.dart';
import 'package:sqflite/sqflite.dart';

class ModelItem extends AbstractModel {

  ///
  ///Singleton
  ///
  
  static ModelItem _this;

  factory ModelItem() {
    if(_this == null){
      _this = ModelItem.getInstance();
    }
    return _this;
  }

  ModelItem.getInstance() : super();

  ///
  ///The Instanse
  ///
  
  @override
  String get dbname => dbName;

  @override
 
  int get dbversion => dbVersion;

  @override
  Future<bool> delete(dynamic id) async {
    Database db = await this.getDb();
    int rows = await db.delete('item', where: 'pk_item = ? ', whereArgs: [id]);

    
    return (rows !=0);
  }

  @override
  Future<Map> getItem(dynamic where) async {
    Database db = await this.getDb();
    List<Map> items = await db.query('item', where: 'pk_item = ?', whereArgs: [where], limit: 1 );

    Map result = Map();
    if(items.isNotEmpty){
      result = items.first;
    }
    return result;

  }

  @override
  Future<int> insert(Map<String, dynamic> values) async {
     Database db = await this.getDb();
     int newId = await db.insert('item', values);

     return newId;
    
  }

  @override
  Future<List<Map>> list() async {

    Database db = await this.getDb();
    return db.query('item', 
     orderBy: 'created DESC');
    //return db.rawQuery('SELECT * fROM item ORDER BY created DESC');
  }

  /// Retorna todos os items da lista
  /// 
  /// [fkLista] ID da lista
  Future<List<Map>> itemByList(int fkLista) async {
    Database db = await this.getDb();
    return db.query('item', where: 'fk_lista = $fkLista', orderBy: 'created DESC');
    //return db.rawQuery('SELECT * fROM item WHERE fk_lista = $fkLista ORDER BY created DESC');
  }




  @override
  Future<bool> update(Map<String, dynamic> values, where) async {
    Database db = await this.getDb();
    int rows = await db.update('item', values, where: 'pk_item = ?', whereArgs: [where]);

    return (rows != 0);
   
  }

}