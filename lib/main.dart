import 'package:colaborae/search_users.dart';
import 'package:flutter/material.dart';

import 'package:colaborae/user_register.dart';
import 'package:colaborae/login.dart';
import 'package:colaborae/start.dart';
import 'package:colaborae/buscar_servico.dart';
import 'package:colaborae/service_register.dart';
import 'package:colaborae/search_services.dart';
import 'package:colaborae/user_profile.dart';
import 'package:colaborae/worker_profile.dart';

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
        '/service_register': (context) => CadastroServico(),
        '/search_services': (context) => SearchService(),
        '/user_profile': (context) => UserProfile(),
        '/worker_profile': (context) => WorkerProfile(),
        '/search_user': (context) => SearchUsers(),
        //ADD more routes here,
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
