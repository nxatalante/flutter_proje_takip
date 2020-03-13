import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/components/user.dart';

class OwnUser extends StatefulWidget {
  final userName;
  OwnUser(this.userName);

  @override
  _OwnUserState createState() => _OwnUserState();
}

class _OwnUserState extends State<OwnUser> {
  UserData user = UserData();
  int userlenght=1 ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 50),
        CircleAvatar(
          backgroundImage: AssetImage(
            "assets/images/images.png",
          ),
        ),
        SizedBox(height: 50),
        FlatButton.icon(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ),
          label: Text("LogOut"),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          },
        ),
         FutureBuilder(
            future: Firestore.instance
                .collection('UserList')
                .document(widget.userName)
                .get()
                .then((value) async {
                  if(value.exists){
                  print(value['UserName']);
                  print(value["UserEmail"]);
                  print(value["UserRegisterDate"]);
              user.username = value['UserName'];
              user.userEmail = value["UserEmail"];
              user.registerDate = value["UserRegisterDate"].toDate();
                  }
              
            }),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error:${snapshot.error}");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading...");
              } // DocumentSnapshot mypost=snapshot.data;
               
              return ListTile(
                title: Text(user.username),
                subtitle: Text("${user.userRegisterDate}"),
                trailing: Text(user.userEmail),
              );
            }),
      ],
    );
  }
}
