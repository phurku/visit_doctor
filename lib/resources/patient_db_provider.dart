import 'package:personal_doctor/models/patient_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'constants.dart';

class DbProvider{
  static final DbProvider _instance = DbProvider.internal();

  factory DbProvider() => _instance;

  static Database _db;

  Future<Database> get db async {
    if(_db == null) {
      _db = await _initDB();
    }
    return _db;
  }

  DbProvider.internal();


  _initDB() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path,"maindb.db");
    var db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database newDb, int version){
          newDb.execute(
           "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY,$columnfullname TEXT,$columnage TEXT,$columndate TEXT, $columnproblems TEXT)"
          );
        },
    );
    return db;
  }

  Future<List> fetchItems() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery('SELECT * FROM $tableName');
    return res;
  }

  Future<List> searchItems(String term) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $tableName WHERE $columnfullname LIKE '%$term%'");
    return res;
  }

  Future<ItemModel> fetchItem(int id) async{
    var dbClient = await db;
    final maps = await dbClient.query(
      tableName,
      columns: null,
      where:"id = ?",
      whereArgs: [id]
    );

    if (maps.length > 0){
     // return ItemModel.fromMap(maps.first);
    }

    return null;
  }

  // Future<int> addItem(ItemModel item) async {
  //   var dbClient = await db;
  //   // return dbClient.insert(tableName, item.toMap());
  // }

  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return dbClient.delete(tableName,where: '$columnId=?',whereArgs: [id]);
  }

}