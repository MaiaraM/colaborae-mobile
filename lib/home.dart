import 'package:colaborae/constants.dart';
import 'package:flutter/material.dart';
import 'package:colaborae/user_register.dart';
import 'package:colaborae/start.dart';
import 'package:colaborae/buscar_servico.dart';
import 'package:colaborae/search_users.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    StartingPage(),
    BuscarServico(),
    UserRegister(),
    SearchUsers(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        fixedColor: mainPurple,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuários',
          ),
        ],
      ),
    );
  }
}
