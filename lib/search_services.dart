// TELA DE QUANDO CLICA NA CATEGORIA EM BUSCAR SERVIÇO
import 'package:flutter/material.dart';
import 'package:colaborae/main.dart';
import 'package:colaborae/constants.dart';
import 'package:colaborae/components/tab_header.dart';
import 'package:colaborae/components/item_servico.dart';

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

  @override
  void initState() {
    super.initState();
    setState(() {
      searchService(widget.userInput);
    });
  }

  void searchService(String userInput) async {
    http.Response res = await http.get('$services_url/search?title=$userInput');

    if (res.statusCode == 200) {
      String data = res.body;
      var jsonParse = jsonDecode(data);
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
      price = json[i]['price'];

      itemsList.add(ServiceItem(
          backgroundColor: musica,
          image: 'piano',
          title: title,
          description: description,
          price: price,
          rating: 'N/E',
          onPress: () {
            print('Serviço selecionado.');
          }));

      itemsList.add(SizedBox(height: 20));

      setState(() {});
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
                actionButton: Icons.filter_alt,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Foram encontrados x resultados.',
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
    );
  }
}
