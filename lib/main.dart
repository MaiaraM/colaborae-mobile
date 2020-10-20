import 'package:flutter/material.dart';
import 'package:colaborae/cadastro.dart';
import 'package:colaborae/login.dart';
import 'package:colaborae/comecar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/comecar': (context) => Comecar(),
        '/cadastro': (context) => Cadastro(),
        //ADD more routes here,
        //ADD more routes here,
        //...
      },
      debugShowCheckedModeBanner: false,
    );
  }
}