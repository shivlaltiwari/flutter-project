
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class databaseHelper{

  static final _dbname= 'mydatabase.db';
  static final _dbversion = 1;
  static final _tablename= 'mytable';
  static final colid = 'id';
  static final colname = 'name';

  databaseHelper._privateinstantiate();
  static final databaseHelper database =   databaseHelper._privateinstantiate();
  Database db;



}