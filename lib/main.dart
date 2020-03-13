import 'package:flutter/material.dart';
import 'package:flutter_proje_takip/pages/app.dart';
import 'package:flutter_proje_takip/pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/":(context) => App(title: "App"),
      "/hello" : (context) => Home(),

    },
  ));
}
