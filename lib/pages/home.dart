import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/pages/addProject.dart';
import 'package:flutter_proje_takip/pages/listProjects.dart';
import 'package:flutter_proje_takip/pages/listUsers.dart';
import 'package:flutter_proje_takip/pages/ownUser.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
         child: OwnUser("1234"),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 20,
          toolbarOpacity: 1,
          title: Text("Home"),
          bottom: TabBar(
            labelPadding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            tabs: <Widget>[
              Tab(
                text: "Add Project",
              ),
              Tab(
                text: "User List",
              ),
              Tab(
                text: "Project List",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AddProject(),
            ListUsers(),
            ListProjects(),
          ],
        ),
      ),
    );
  }
}
