import 'package:flutter/material.dart';
import 'package:myapp/Database_Helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import './Database_Helper.dart';
void main(){
  // String _data = await getjson();
  // print(_data);
  runApp(
    new MaterialApp(
      title: "practice App",
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    )
  );
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("SQFLITE Database"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             RaisedButton(onPressed:() async{
              var i = await DatabaseHelper.instance.insert(
                 {
                   DatabaseHelper.colname:'tiwari'
                 }
               );
                print("the inserted id is : $i");
             }, 
            child: new Text("Insert", style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0,decorationColor: Colors.black87,
            ),),color: Colors.deepOrange,),
            RaisedButton(onPressed: () async{
              List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
              print(queryRows);
            }
            
            
            
            , child: new Text("Query", style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0,decorationColor: Colors.black87,
            ),),color: Colors.deepOrange,),
            RaisedButton(onPressed: null, child: new Text("Insert", style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0,decorationColor: Colors.black87,
            ),),color: Colors.deepOrange,),
           RaisedButton(onPressed: () async{
             int rowdelet =  await DatabaseHelper.instance.delete(13);
              print(rowdelet);
           }
           
           
           
           
           
           , child: new Text("Delete", style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0,decorationColor: Colors.black87,
            ),),color: Colors.deepOrange,),
          ],
        ),
      ),
      
    );
  }
}
