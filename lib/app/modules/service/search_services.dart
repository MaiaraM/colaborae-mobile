// TELA DE QUANDO CLICA NA CATEGORIA EM BUSCAR SERVIÇO
//import 'package:colaborae/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:colaborae/app/shared/components/tab_header.dart';
import 'package:colaborae/app/shared/components/service_item.dart';

//import 'package:flutter_svg/flutter_svg.dart';

// Requests
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchService extends StatefulWidget {
  SearchService({this.userInput});

  final userInput;

  @override
  _SearchServiceState createState() => _SearchServiceState();
}

const base_url = 'http://api-colaborae.herokuapp.com/';
const services_url = '$base_url/services';

class _SearchServiceState extends State<SearchService> {
  List<Widget> itemsList = [];
  int itemsCount = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      searchService(widget.userInput);
    });
  }

  void searchService(String userInput) async {
    http.Response res = await http.get('$services_url/search?title=$userInput',
        headers: {'Content-Type': 'application/json'});

    if (res.statusCode == 200) {
      String data = res.body;
      var jsonParse = jsonDecode(utf8.decode(data.codeUnits));
      generateServiceItem(jsonParse);
    } else {
      print(res.statusCode);
    }
  }

  void generateServiceItem(dynamic json) {
    for (int i = 0; i < json.length; i++) {
      var title, description, price;

      title = json[i]['title'];
      description = json[i]['description'];
      price = json[i]['value'];

      itemsList.add(ServiceItem(
          backgroundColor: outros,
          image: 'imagens/tea_S.png',
          title: title,
          description: description,
          price: price,
          rating: 'five-stars',
          onPress: () {
            print('Serviço selecionado.');
          }));

      itemsList.add(SizedBox(height: 15));

      setState(() {});

      itemsCount++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: padding,
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
                    ? 'Foram encontrados ${itemsCount} resultados.'
                    : 'Nenhum serviço encontrado.',
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
