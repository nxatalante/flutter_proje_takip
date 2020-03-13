import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProjectDetails extends StatefulWidget {
  final String id;
  final String projectName;
  ProjectDetails({this.projectName, this.id});

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  List<String> cities;

  List<String> users;

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Column(
      children: <Widget>[
        Text(
          "Şehirler",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection('projeListe')
                  .document(widget.id)
                  .collection("Cities")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Text("Loading ...");
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        var userDocument = snapshot.data.documents[index];
                        return Row(
                          children: <Widget>[
                            Text(userDocument["City1"],
                                style: TextStyle(fontSize: 20)),
                            Text(","),
                            Text(userDocument["City2"],
                                style: TextStyle(fontSize: 20)),
                            Text(","),
                            Text(userDocument["City3"],
                                style: TextStyle(fontSize: 20)),
                          ],
                        );
                      });
                }
              }),
        ),
        Text(
          "Kullanıcılar",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: StreamBuilder(
              stream: Firestore.instance
                  .collection('projeListe')
                  .document(widget.id)
                  .collection("users")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Text("Loading ...");
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        var userDocument = snapshot.data.documents[index];
                        return Row(
                          children: <Widget>[
                            Text(userDocument["User1"],
                                style: TextStyle(fontSize: 20)),
                            Text(","),
                            Text(userDocument["User2"],
                                style: TextStyle(fontSize: 20)),
                            Text(","),
                            Text(userDocument["User3"],
                                style: TextStyle(fontSize: 20)),
                          ],
                        );
                      });
                }
              }),
        ),
      ],
    );
  }
}
