import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:colaborae/user_register.dart';
import 'package:colaborae/login.dart';
import 'package:colaborae/start.dart';
import 'package:colaborae/buscar_servico.dart';
import 'package:colaborae/cadastrar_servico.dart';
import 'package:colaborae/search_services.dart';

void main() {
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/start',
      routes: {
        '/login': (context) => Login(),
        '/start': (context) => StartingPage(),
        '/user_register': (context) => UserRegister(),
        '/buscar_servico': (context) => BuscarServico(),
        '/cadastro_servico': (context) => CadastroServico(),
        '/search_services': (context) => SearchService(),
        //ADD more routes here,
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
