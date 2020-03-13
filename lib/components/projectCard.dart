import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/components/projectDetails.dart';

class ProjectCard extends StatelessWidget {
  final String id;
  final String projectName;
  ProjectCard({this.id, this.projectName});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lime,
      margin: EdgeInsets.all(5),
         child: ExpansionTile(
        backgroundColor: Colors.red,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "$id",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Text(
              "$projectName",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            SizedBox(width: 10),
          ],
        ),
        children: <Widget>[
          ProjectDetails(id: id,projectName:projectName ,),
          FlatButton.icon(
              onPressed: () {
                Firestore.instance.collection("projeListe").document(id).delete();
                Firestore.instance.collection("projeListe").document(id).collection("Cities").document("City").delete();
                Firestore.instance.collection("projeListe").document(id).collection("users").document("User").delete();
              },
              icon: Icon(Icons.delete),
              label: Text("Delete Project"),
            )
        ],
      ),
    );
  }
}

//işler ters giderse kodun eski hali

/*class ProjectCard extends StatelessWidget {
  List<String> projectSubsID = [];
  final String id;
  ProjectCard({this.id});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: StreamBuilder(
          stream: Firestore.instance.collection('projeListe').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              const Text("Loading");
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mypost = snapshot.data.documents[index];
                    projectSubsID.add(mypost['ID']);
                    return Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 14.0,
                                  shadowColor: Color(0x802186f3),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        children: <Widget>[
                                          //SizedBox(height: 10),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                               Text(
                                              "${mypost['ProjectName']}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          SizedBox(width: 10),
                                          Text(
                                            "${mypost['ID']}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey),
                                          ),
                                          SizedBox(width: 10),
                                          FlatButton.icon(
                                            onPressed: (){},
                                             icon: Icon(Icons.linear_scale),
                                             label: Text(""),)
                                            ],
                                          ),
                                            
                                          //SizedBox(height: 10),
                                          /*StreamBuilder(
                                              stream: Firestore.instance
                                                  .collection('projeListe')
                                                  .document(projectSubsID[index])
                                                  .collection("Cities").
                                                  document("City").
                                                  snapshots(),
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData) {
                                                  return Text("Loading");
                                                }
                                                var userDocument =
                                                    snapshot.data;
                                                return Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[

                                                  Text(userDocument["City1"]),
                                                  Text(","),
                                                  Text(userDocument["City2"]),
                                                  Text(","),
                                                  Text(userDocument["City3"]),

                                                ] );
                                              }),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}*/
