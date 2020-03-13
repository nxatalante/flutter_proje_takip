import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/components/projectCard.dart';

class ListProjects extends StatefulWidget {
  ListProjects({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ListProjects createState() => _ListProjects();
}

class _ListProjects extends State<ListProjects> {
  List<String> projectSubsID = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.zero,
                child: Column(
            children: <Widget>[
              StreamBuilder(
              stream: Firestore.instance.collection('projeListe').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                else if(snapshot.connectionState == ConnectionState.waiting){
                  return Text("Loading ...");
                }
                else {
                return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot mypost = snapshot.data.documents[index];
                        projectSubsID.add(mypost['ID']);
                        print(projectSubsID);
                        return Column(
                          children: <Widget>[
                            ProjectCard(
                              id: mypost['ID'],
                              projectName: mypost['ProjectName'],
                            ),
                        ],);
                }
                );
              }
              },
              ),
            ],
          ),
        )
      );
  }
}

/// StreamBuilder(
/*stream: Firestore.instance
      .collection('projeListe')
      .document("7777825")
      .collection("users")
      .snapshots(),
      builder:(context,snapshot){
        if(snapshot.hasError){
          return Text("Error:${snapshot.error}");
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Text("Loading...");
        }
        
          return ListView.builder(
            itemCount:snapshot.data.documents.length,
            itemBuilder:(context,index){
              DocumentSnapshot mypost=snapshot.data.documents[index];
               return ListTile(
                 title: Text(mypost['User1']),
                // trailing: Text(mypost['Age']),
               );
            }
            ); 
        }
      
      ),*/
