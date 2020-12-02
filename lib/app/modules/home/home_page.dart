import 'package:colaborae/app/modules/service/buscar_servico.dart';
import 'package:colaborae/app/modules/service/service_register_page.dart';
import 'package:colaborae/app/modules/user/pages/search_users.dart';
import 'package:colaborae/app/modules/user/pages/user_profile_page.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    UserProfile(),
    BuscarServico(),
    CadastroServico(),
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
            title: Text('Minha Conta'),
            label: 'Minha Conta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Buscar'),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Cadastro'),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Usuários'),
            label: 'Usuários',
          ),
        ],
      ),
    );
  }
}
