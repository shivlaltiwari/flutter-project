
// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    new MaterialApp(
      title: "CRUD operation",
      debugShowCheckedModeBanner: false,
      home:Homepage(),
    )
  );
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String studentName, studentID, studentrogramID;
  String studentGPA;
   getstudentName(name){
     this.studentName = name;
   }
   getstudentID(id){
     this.studentID = id;
   }
   getstudentprogramID (programID){
     this.studentrogramID =programID;
   }
   getstudentGPA(gPA){
     this.studentGPA =gPA;
   }

  createdata(){
    print("Created");
   // DocumentReference documentReference = Firestore.instance.collection("mystudent").document(studentName);
    DocumentReference documentReference = FirebaseFirestore.instance.collection("mystudent").doc(studentName);
    Map <String, dynamic> student ={
      "studentName": studentName,
      "studentID": studentID,
      "studentprogramID": studentrogramID,
      "GPA": studentGPA
    };
    documentReference.set(student).whenComplete(() => {
      print("$studentName created"),
    });
  }
    readdata(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("mystudent").doc(studentName);
    documentReference.get().then((dataSnapshot) => {
      print(DataSnapshot.data(["studentName"]));
      print(DataSnapshot.data(["studentID"]));
      print(DataSnapshot.data(["studentrogramID"]));
      print(DataSnapshot.data(["studentGPA"]));
    });

  }
  updatedata(){
    print("updated");
  }
  deletdata(){
    print("Deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("CRUD OPR"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0
                  )
                )
              ),
              onChanged: (String name){
                 getstudentName(name);
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            TextField(
              decoration: InputDecoration(
                labelText: "Student ID",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0
                  )
                )
              ),
              onChanged: (String id){
                getstudentID(id);
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Srudent program ID",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0
                  )
                )
              ),
              onChanged: (String programID){
               getstudentprogramID(programID);
              },
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            TextFormField(
              decoration: InputDecoration(
                labelText: "GPA",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0
                  )
                )
              ),
              onChanged: (String gpa){
                getstudentGPA(gpa);
              },
            ),
            Padding(padding: EdgeInsets.all(5)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: 
                  new RaisedButton(onPressed: (){
                    createdata();
                  },
                 color: Colors.blue,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                 child: new Text("Create"),
                 textColor: Colors.white,
                ),
                ),
                 new RaisedButton(onPressed: (){
                   readdata();
                 },
                 color: Colors.orange,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                 child: new Text("Read"),
                 textColor: Colors.white,
                ),
                 new RaisedButton(onPressed: (){
                   updatedata();
                 },
                 color: Colors.yellow,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                 child: new Text("Update"),
                 textColor: Colors.white,
                ),
                 new RaisedButton(onPressed: (){
                   deletdata();
                 },
                 color: Colors.red,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                 child: new Text("Delet"),
                 textColor: Colors.white,
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}