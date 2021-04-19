import 'package:flutter/material.dart';
import './database_helper.dart';
import './User.dart';
import 'User.dart';
List user;
void main(List<String> args)  async{
  var db = new databaseHelper.internal();
  //add user
  int saveuser = await db.Saveuser(new User( "tiwari","tiwari",1));
  print("userSaved: $saveuser");

  runApp(
    new MaterialApp(
      title: "Database",
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    )
  );
}
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
      ),
      
    );
  }
}