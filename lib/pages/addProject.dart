import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/components/project.dart';
import 'package:flutter_proje_takip/database/crud.dart';

class AddProject extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  List<String> _bars = [
    "ID",
    "Project Name",
    "Project User1",
    "Project User2",
    "Project User3",
    "Project City1",
    "Project City2",
    "Project City3",
  ];

  var id;
  List<String> projectImport = [];
  CrudMethods crudObj = CrudMethods();
  Project project = Project();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(hintText: " ${_bars[0]}"),
                  onSaved: (c) {
                    project.projectID = c + "";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  //keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: " ${_bars[1]}"),
                  onSaved: (c) {
                    project.projectName = c + "";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  //keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: " ${_bars[2]}"),
                  onSaved: (c) {
                    project.projectUser1 = c + "";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  //keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: " ${_bars[3]}"),
                  onSaved: (c) {
                    project.projectUser2 = c + "";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "${_bars[4]}"),
                  onSaved: (c) {
                    project.projectUser3 = c + "";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "${_bars[5]}"),
                  onSaved: (c) {
                    project.projectCity1 = c + "";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "${_bars[6]}"),
                  onSaved: (c) {
                    project.projectCity2 = c + "";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "${_bars[7]}"),
                  onSaved: (c) {
                    project.projectCity3 = c + "";
                  },
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Submit"),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Map<String, dynamic> projectID = {
                      'ID': project.projectID,
                    };
                    Map<String, dynamic> cities = {
                      'City1': project.projectCity1,
                      'City2': project.projectCity2,
                      'City3': project.projectCity3,
                    };
                    Map<String, dynamic> user = {
                      'User1': project.projectUser1,
                      'User2': project.projectUser2,
                      'User3': project.projectUser3,
                    };
                    Map<String, dynamic> projectName = {
                      'ProjectName': project.projectName,
                    };
                    id = project.projectID;
                    crudObj
                        .addData(id, cities, user, projectName, projectID)
                        .catchError((e) {
                      print(e);
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
Form(
      key: _formKey,
      child: ListView.builder(
        itemCount: _bars.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "${_bars[index]}"),
                  onSaved: (c) {
                    projectImport.add(c);
                    //projectImport[index] = c.toString();
                    /*Project proje = Project(
                      projectImport[0],
                      projectImport[1],
                      projectImport[2],
                      projectImport[3],
                      projectImport[4],
                      projectImport[5],
                    );*/
                    print(projectImport[0]);
                    print(projectImport[1]);
                    print(projectImport[2]);
                  },
                ),
              ),
              index == 5
                  ? RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("Add Project"),
                      onPressed: () {
                        _formKey.currentState.save();
                        Map<String, dynamic> projectID = {
                          'ID': projectImport[0],
                        };
                        Map<String, dynamic> cities = {
                          'City1': projectImport[2],
                        };
                        Map<String, dynamic> user = {
                          'User1': projectImport[3],
                        };
                        Map<String, dynamic> projectName = {
                          'ProjectName': projectImport[1],
                        };
                        projectImport[0] = id.toString();

                        crudObj
                            .addData(projectID, cities, user, projectName, projectID)
                            .catchError((e) {
                          print(e);
                        });
                      },
                    )
                  : Text(""),
            ],
          );
        },
      ),
    );*/
