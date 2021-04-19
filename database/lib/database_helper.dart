
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
class databaseHelper{

  static final _dbname= 'mydatabase.db';
  static final _dbversion = 1;
  static final _tablename= 'mytable';
  static final colid = 'id';
  static final colname = 'username';
  static final colpword = 'password';
  static final databaseHelper _instance = new databaseHelper.internal();
  databaseHelper.internal();
  static Database _db;
  Future<Database> get db async{
    if (_db != null){
      return _db;
    }
    _db = initdb();
    return _db;
  }
 initdb() async{
   Directory directory = await getApplicationDocumentsDirectory();
   String path = join( directory.path , "mydatabase.db");
   var ourdb = await openDatabase(path, version:1,onCreate: _oncreate);
   return ourdb;
 }
  void _oncreate(Database db, int newersion) async{
    await db.execute(
      '''
      CREATE TABLE $_tablename (
        $colid INTEGER PRIMARYKEY,
        $colname TEXT NOTNULL, $colpword TEXT 
      )
      '''
    );
  }
 Future<int> Saveuser(User user) async{
   var dbclint = await db;
   int res = await dbclint.insert("$_tablename", user.toMap());
   return res;

 }

  // getting all user
  Future<List> getAlluser() async{
    var dbclint = await db;
    var result = await dbclint.rawQuery(
      "SELECT * FROM $_tablename"
    );
    return result.toList();
  }
  Future<int> getcount() async{
    var dbclint = await db;
    return Sqflite.firstIntValue( await dbclint.rawQuery(
      "SELECT COUNT(*) FROM $_tablename"
    ));
  }
  Future<User> getuser(int id) async{
    var dbclint = await db;
    var result = await dbclint.rawQuery(
      "SELECT * FROM $_tablename WHERE $colid = $id"
    );
  if (result.length ==0) return null;
   return new User.fromMap(result.first);
  }
  Future<int> deletUser(int id) async{
    var dbclint = await db;
    return await dbclint.delete(
      "$_tablename WHERE $colid = ? whereArgs:[id]"
    );
  }
  Future<int> updateUser(User user) async{
    var dbclint = await db;
    return await dbclint.update("$_tablename", user.toMap(), where: "$colid = ?", whereArgs: [user.id]);
  }
  Future close() async{
    var dbclint = await db;
    return dbclint.close();
  }
}