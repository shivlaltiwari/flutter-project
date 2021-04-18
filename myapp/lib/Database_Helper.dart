import 'dart:io';
import 'dart:async';
// import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:core';



class DatabaseHelper{
 static final _dbename = 'myDatabase.db';
 static final _dbVersion = 1;
 static final _tableName = 'mytable';
 static final _colid = 'id';
 static final colname = 'name';
 DatabaseHelper._privateConstructo();
 static final DatabaseHelper instance = DatabaseHelper._privateConstructo();
 static Database _database;

 Future<Database> get databse async{
   if (_database != null) return _database;

     _database = await _initiateDatabase();
     return _database;
 }
//  DatabaseHelper.internal();
 _initiateDatabase() async{
   Directory directory = await getApplicationDocumentsDirectory();
   String path = join(directory.path , _dbename);
   return await openDatabase(path, version:1, onCreate: _oncreate);
 }
  void _oncreate(var db , int version) async{
    await db.execute(
      '''
          CREATE TABLE $_tableName(
            $_colid INTEGER PRIMARYKEY ,
            $colname TEXT NOT NULL
          )
      '''
    );

  }
  Future <int> insert(Map<String,dynamic> row) async{
    Database db = await instance.databse;
    return await db.insert(_tableName, row);
  }
  Future<List<Map<String, dynamic>>> queryAll()async{
    Database db = await instance.databse;
    return await db.query(_tableName);
  }
  // ignore: missing_return
  // Future<int> update(<Map<String,dynamic>, row) async{
  //   Database db = await instance.databse;
  //   int id = _database[_colid];
  //   return await db.update(_tableName,Row, where:'$_colid = ?', whereArgs:[id]);
  // }
   Future<int> delete(int id) async{
    Database db = await instance.databse;
    return await db.delete(_tableName, where:'$_colid=?', whereArgs:[id]);
  }
}