import 'package:flutter/material.dart';
import 'package:colaborae/cadastro.dart';
import 'package:colaborae/login.dart';
import 'package:colaborae/comecar.dart';
import 'package:colaborae/buscar_servico.dart';
// import 'package:colaborae/constants.dart';

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
        '/buscar_servico': (context) => BuscarServico(),
        //ADD more routes here,
        //ADD more routes here,
        //...
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
