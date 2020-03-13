import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/database/isAuth.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _formKey = GlobalKey<FormState>();
  
  bool idCorrection;
  String password, userName;
  Authentication auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.grey[600],
      initiallyExpanded: true,
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
                padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextFormField(
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(hintText: "UserName"),
                  cursorColor: Colors.blue,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "UserName is Required";
                    }
                  },
                  onSaved: (value) {
                    userName = value;
                  },
                ),
              ),
              Container(
                color: Colors.lime,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password is Required";
                    }
                  },
                  onSaved: (value) {
                    password = value;
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
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      if (await auth.auth(password, userName)) {
                        var snackBar = Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Giriş Başarılı"),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                        await new Future.delayed(
                            const Duration(milliseconds: 500));
                        Navigator.pushNamed(
                          context,
                          "/hello",
                        );
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Şifre veya Kullanıcı Adı Hatalı"),
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

                    /*var snackBar =Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("Giriş Başarılı")),
                              );
                              snackBar.closed.then((onValue) => Navigator.pushNamed(context, "/hello"),);*/
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
