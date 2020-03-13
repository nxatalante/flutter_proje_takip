import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods {
Future <void> addData(id,cities,users,projectName,projectID) async {
  /*Firestore.instance.collection("projeListe").document("$id").collection("Cities").add(cities).catchError((e){
    print(e);
  });*/
  Firestore.instance.collection("projeListe").document("$id").collection("Cities").document("City").setData(cities,merge:true);


  /*Firestore.instance.collection("projeListe").document("$id").collection("users").add(users).catchError((e){
    print(e);
  });*/

  Firestore.instance.collection("projeListe").document("$id").collection("users").document("User").setData(users,merge:true);

   Firestore.instance.collection("projeListe").document("$id").setData(projectName,merge: true);
   Firestore.instance.collection("projeListe").document("$id").setData(projectID,merge: true);
}
}
