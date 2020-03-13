import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/components/user.dart';
import 'package:flutter_proje_takip/database/Register.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
  UserData userdata = UserData();
  RegisterUser crudUser = RegisterUser();

  String password, passwordCorrection, userName, email;
  bool passwordValidation;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.grey[600],
      initiallyExpanded: false,
      title: Text("UserLogin"),
      trailing: Icon(Icons.arrow_drop_down_circle),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.lime,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "UserName"),
                  cursorColor: Colors.red,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "UserName is Required";
                    }
                  },
                  onSaved: (value) {
                    userdata.username = value;
                  },
                ),
              ),
             Container(
                color: Colors.lime,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Email is Required";
                    }
                  },
                  onSaved: (value) {
                    userdata.userEmail = value;
                  },
                ),
              ),
              Container(
                color: Colors.lime,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password is Required";
                    }
                  },
                  onSaved: (value) {
                    userdata.userPassword = value;
                  },
                ),
              ),
              Container(
                color: Colors.lime,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "PasswordAgain"),
                  validator: (value) {
                    if (value.isEmpty) {
                      //passwordValidation = false;
                      print(value);
                      print(password);
                      return "Password Correction is Required";
                    }
                  },
                  onSaved: (value) {
                    userdata.userPasswordCorrection = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Log In"),
                  onPressed: () async {
                    userdata.userRegisterDate= DateTime.now();
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if (userdata.userPasswordCorrection == userdata.userPassword) {
                        Map<String, dynamic> userName = {
                          'UserName': userdata.username,
                        };
                        Map<String, dynamic> email = {
                          'UserEmail': userdata.userEmail,
                        };

                        Map<String, dynamic> regTime = {
                          'UserRegisterDate': userdata.userRegisterDate,
                        };

                        var pass = userdata.userPassword;
                        crudUser.addUser(pass, userName,email,regTime).catchError((e) {
                          print(e);
                        });

                        var snackBar = Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Kayıt Başarılı"),
                            duration: Duration(seconds: 1),
                          ),
                         
                        );
                        
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Şifre Doğrulama Hatalı"),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Tamam")),
                                ],
                              );
                            });
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
