// TELA DE QUANDO CLICA NA CATEGORIA EM BUSCAR SERVIÇO
//import 'package:colaborae/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:colaborae/app/shared/components/tab_header.dart';
import 'package:colaborae/app/shared/components/service_item.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

//import 'package:flutter_svg/flutter_svg.dart';

// Requests
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'controllers/service_controller.dart';

class SearchService extends StatefulWidget {
  SearchService({this.userInput});

  final userInput;

  @override
  _SearchServiceState createState() => _SearchServiceState();
}

class _SearchServiceState extends State<SearchService> {
  final serviceController = Modular.get<ServiceController>();

  @override
  void initState() {
    super.initState();
    serviceController.searchService(widget.userInput);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: Observer(builder: (_) {
            if (serviceController.loading) {
              return CircularProgressIndicator();
            }

            if (serviceController.services != null) {
              List<Widget> itemsList = [];

              for (int i = 0; i < serviceController.services.length; i++) {
                var title, description, price;

                title = serviceController.services[i].title;
                description = serviceController.services[i].description;
                price = serviceController.services[i].value;

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
              }

              return ListView(
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
                    serviceController.services.length != 0
                        ? 'Foram encontrados ${serviceController.services.length} resultados.'
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
              );
            } else {
              return Text("Nenhum serviço encontrado.");
            }
          }),
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
