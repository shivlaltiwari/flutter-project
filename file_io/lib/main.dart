import 'dart:html';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
void main(List<String> args) {
  runApp(
    new MaterialApp(
      title: "FILE_I/O",
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
      
    );
  }

  Future<String> get _localpath async{
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localfile async{
    final path = _localpath;
    final file = ('$path/file.txt');
     return (file);
  }
  Future<String> writeonFile (String message) async{
    final file = await _localfile;
    return (file.wrteAsString('$message'));
  }
  Future<String> readFromFile() async{
    try{
        final file = await _localfile;
        String data = file.readAsString();
        return data;
    }
    catch(e){
      return "Nothing is saved";
    }
  }

}