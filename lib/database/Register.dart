import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterUser {
  Future<void> addUser(password, userName, email,regtime) async {
    Firestore.instance
        .collection("UserList")
        .document("$password")
        .setData(userName,merge: true);
    Firestore.instance
        .collection("UserList")
        .document("$password")
        .setData(email,merge: true);
        Firestore.instance
        .collection("UserList")
        .document("$password")
        .setData(regtime,merge: true);
  }
}
