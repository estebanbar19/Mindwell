import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase{

  static RealtimeDatabase? _instance;
  static bool _isInitialized = false;

  RealtimeDatabase();

  static FirebaseDatabase? database;

  DatabaseReference get getDatabaseReference => database!.ref();

  static RealtimeDatabase getInstance(){
    if(!_isInitialized){
      database = FirebaseDatabase.instance;
      _instance = RealtimeDatabase();
      _isInitialized = true;
    }
    return _instance!;
  }

  Future<void> updateProfile(String userId, String name) async {
    await getDatabaseReference.child(userId).set({
      "name": name,
    });
  }

}

