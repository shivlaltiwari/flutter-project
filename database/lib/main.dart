import 'package:flutter/material.dart';

void main(List<String> args) {
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