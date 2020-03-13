import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ListUsers extends StatefulWidget {
  ListUsers({Key key,this.title}) : super (key:key);
  final String title;
  @override
  _ListUsers createState() => _ListUsers();
}

class _ListUsers extends State<ListUsers> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: StreamBuilder(
      stream: Firestore.instance.collection('UserList').snapshots(),
      builder:(context,snapshot){
        if(snapshot.hasError){
          
          return Text("Error:${snapshot.error}");
        }
        if(snapshot.connectionState==ConnectionState.waiting ){
          return Text("Loading...");
        }
        
          return ListView.builder(
            itemCount:snapshot.data.documents.length,
            itemBuilder:(context,index){
              DocumentSnapshot mypost=snapshot.data.documents[index];
               return ListTile(
                 title: Text(mypost['UserName']),
                 trailing: Text(mypost['UserEmail']),
                 
               );
            }
            ); 
        }
      ),
    );
  }
}