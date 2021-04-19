import 'dart:core';
class User{
  String _colname;
  String _colpword;
  int _colid;

  User(this._colname, this._colpword, this._colid);
  User.map(dynamic obj){
    this._colname = obj['username'];
    this._colpword = obj['password'];
    this._colid = obj['id'];

  }
  String get username  => _colname;
  String get password => _colpword;
  int get id => _colid;
  Map<String, dynamic> toMap(){
    var map = new Map <String, dynamic>();
    map['username']= _colname;
    map['password'] = _colpword;
    if (id != Null){
      map["id"] = _colid;
     }
    return map;
  }
  User.fromMap(Map<String,dynamic>map){
    this._colname = map['username'];
    this._colpword = map['passsword'];
    this._colid = map['id'];
  }
}