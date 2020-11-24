// TELA DE QUANDO CLICA NA CATEGORIA EM BUSCAR USUARIO
//import 'package:colaborae/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:colaborae/app/shared/components/tab_header.dart';
import 'package:colaborae/app/shared/components/user_item.dart';

// Requests
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchUsers extends StatefulWidget {
  // SearchUsers({this.userInput});
  // final userInput;

  @override
  _SearchUsersState createState() => _SearchUsersState();
}

const base_url = 'http://api-colaborae.herokuapp.com';
const services_url = '/users';

class _SearchUsersState extends State<SearchUsers> {
  List<Widget> itemsList = [];
  int itemsCount = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      searchUser();
    });
  }

  void searchUser() async {
    http.Response res = await http.get('$base_url$services_url?page=0&size=99',
        headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      String data = res.body;
      var jsonParse = jsonDecode(utf8.decode(data.codeUnits));

      generateUserItem(jsonParse);
    } else {
      print(res.statusCode);
    }
  }

  void generateUserItem(dynamic json) {
    for (int i = 0; i < 99; i++) {
      if (json['content'][i]['active'] == true) {
        var name, surname, description;

        name = json['content'][i]['firstName'];
        surname = json['content'][i]['lastName'];
        description = json['content'][i]['description'];

        itemsList.add(UserItem(
            backgroundColor: musica,
            image: 'profiles/pfp4.jpg',
            title: '$name $surname',
            description: description,
            onPress: () {
              print('Usuário selecionado.');
            }));

        itemsList.add(SizedBox(height: 15));

        setState(() {});

        itemsCount++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // Título da aba
              TabHeader(
                icon: Icons.arrow_back,
                title: 'Encontrados',
                haveButton: true,
                actionButton: 'sliders',
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                itemsCount != 0
                    ? 'Foram encontrados $itemsCount resultados.'
                    : 'Nenhum usuário encontrado.',
                style: TextStyle(
                  color: lightGray,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: itemsList,
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
