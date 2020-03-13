import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_proje_takip/components/auth.dart';

class Authentication {

  Authen bisey = Authen();


  int i;
  Future<bool> auth(password, userName) async {
    await Firestore.instance
        .collection("UserList")
        .document(password)
        .get()
        .whenComplete(() => null)
        .then((value) async {
      value["UserName"] == userName ? bisey.au = true : bisey.au = false;

    }).catchError((onError) {
      bisey.au = false;
    });
    //await new Future.delayed(const Duration(milliseconds: 1000));

    if (bisey.au == true)
      return true;
    else
      return false;
  }
}

/*Firestore.instance.collection("UserList").document(password).get()
    .then((value) {
      value["UserName"]==userName ? bisey.au=true : bisey.au=false;
      }
      ).catchError((onError){print(onError);});
      if(bisey.au==true) return true;
      else return false;
      */
