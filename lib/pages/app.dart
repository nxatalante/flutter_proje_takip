import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/components/userLogIn.dart';
import 'package:flutter_proje_takip/components/userRegister.dart';

class App extends StatefulWidget {
  App({title});
  @override
  _AppState createState() => _AppState();
}

/*class ExpansionDrawer {
  ExpansionDrawer(
      {this.isExpanded: false,
      this.body1,
      this.header,
      this.body2,
      this.body3,
      this.body4});
  bool isExpanded;
  String header;
  String body1, body2, body3, body4;
}*/

class _AppState extends State<App> {
  /*List<ExpansionDrawer> _drawers = <ExpansionDrawer>[
    ExpansionDrawer(header: "UserLogin", body1: "UserName", body3: "Password"),
    ExpansionDrawer(
        header: "Register",
        body1: "Email",
        body2: "UserName",
        body3: "Password",
        body4: "Password Confirm")
  ];
  String error;
  bool login = true;
  int index = 1;
  int pos = -1;
  */
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(title: Text("Proje Takip"),),
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          //klavye açıldığında hata vermesini engellemek için ekranı kaydırılabilir yapıyor
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height:10,
              ),
              UserLogin(),
              SizedBox(height: 10),
              UserRegister(),
              
            ],
          ),
        ));
  }
}

/*
//Expansionpanellist.radio // gerekirse sizedboxın altına
ExpansionPanelList.radio(
                initialOpenPanelValue: 0,
                children: _drawers.map<ExpansionPanelRadio>((ExpansionDrawer c) {
                  index == 1 ? login = true : login = false;
                  index++;
                  pos++;
                  return ExpansionPanelRadio(
                    value:c,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(c.header),
                      );
                    },
                    //isExpanded: c.isExpanded,
                    body: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: TextFormField(
                              key: _passKey,
                              decoration: InputDecoration(
                                  hintText: "${_drawers[pos].body1}"),
                              cursorColor: Colors.red,
                              onSaved: (value) {
                                setState(() {
                                  userName = value;
                                });
                                print (userName);
                                
                              },
                            ),
                          ),
                          login == true
                              ? SizedBox(
                                  height: 1,
                                )
                              : Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "${_drawers[pos].body2}"),
                                    onSaved: (value) {
                                      setState(() {
                                        //userName = value;
                                      });
                                      
                                    },
                                  ),
                                ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "${_drawers[pos].body3}"),
                              onSaved: (value) {
                                setState(() {
                                  password = value;
                                });
                                print (password);
                              },
                            ),
                          ),
                          login == true
                              ? SizedBox(
                                  height: 1,
                                )
                              : Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        hintText: "${_drawers[pos].body4}"),
                                    onSaved: (value) {
                                      //password = value;
                                    },
                                  ),
                                ),
                              login == false
                              ? SizedBox(
                                height: 1,
                                ):
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text("Log In"),
                              onPressed: () async{
                                //FormState form = Form.of(context);
                                //form.save();
                                _passKey.currentState.save();
                                Navigator.pushNamed(context,"/hello");
                                crudObj.addData(userName).catchError((e){print(e);});
                                crudObj.addData(password).catchError((e){print(e);});
                              },
                            ),
                          ),

                           login == true
                              ? SizedBox(
                                height: 1,
                                ):
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text("Register"),
                              onPressed: () {
                                /*dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                
                                if(result == null) {
                                  setState(() {
                                    error="Please Enter a Valid Mail";
                                  }
                                  );
                                }*/
                              },
                            ),
                          ),
                          //SizedBox(height: 12),
                          //Text(error , style: TextStyle(color: Colors.red),),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
//EXPANSİONLİST // gerekirse sizedbox ın altına alıyoruz
ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _drawers[index].isExpanded = !_drawers[index].isExpanded;
                  });
                },
                children: _drawers.map((ExpansionDrawer c) {
                  index == 1 ? login = true : login = false;
                  index++;
                  pos++;
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(c.header),
                      );
                    },
                    //isExpanded: c.isExpanded,
                    body: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "${_drawers[pos].body1}"),
                              cursorColor: Colors.red,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "${_drawers[0].body1} is Required";
                                }
                              },
                              onSaved: (value) {
                                email = value;
                              },
                            ),
                          ),
                          login == true
                              ? SizedBox(
                                  height: 1,
                                )
                              : Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "${_drawers[pos].body2}"),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "${_drawers[1].body2} is Required";
                                      }
                                    },
                                    onSaved: (value) {
                                      password = value;
                                    },
                                  ),
                                ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "${_drawers[pos].body3}"),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "${_drawers[0].body3} is Required";
                                }
                              },
                              onSaved: (value) {
                                password = value;
                              },
                            ),
                          ),
                          login == true
                              ? SizedBox(
                                  height: 1,
                                )
                              : Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "${_drawers[pos].body4}"),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "${_drawers[1].body4} is Required";
                                      }
                                    },
                                    onSaved: (value) {
                                      password = value;
                                    },
                                  ),
                                ),
                              login == false
                              ? SizedBox(
                                height: 1,
                                ):
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text("Log In"),
                              onPressed: () {
                                if (_formKey1.currentState.validate()) {
                                  _formKey1.currentState.save();
                                }
                              },
                            ),
                          ),

                           login == true
                              ? SizedBox(
                                height: 1,
                                ):
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: RaisedButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: Text("Register"),
                              onPressed: () {
                                if (_formKey1.currentState.validate()) {
                                  _formKey1.currentState.save();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: c.isExpanded,
                  );
                }).toList(),
              ),*/

//EXPANSİON TİLE
