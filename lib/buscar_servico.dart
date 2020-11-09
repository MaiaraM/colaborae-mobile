import 'package:colaborae/search_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:flutter/foundation.dart';
import 'dart:async';

import 'package:colaborae/constants.dart';
import 'package:colaborae/components/category_card.dart';

class BuscarServico extends StatefulWidget {
  @override
  _BuscarServicoState createState() => _BuscarServicoState();
}

class _BuscarServicoState extends State<BuscarServico> {
  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
          child: ListView(
            children: [
              // Título da aba
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: mainPurple,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Center(
                    child: Text(
                      'Buscar serviço',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // Barra de pesquisa e botão de adicionar serviço novo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: lighterGray,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 0, 12, 0),
                            child: Icon(Icons.search_rounded),
                          ),
                          // Text Field
                          Expanded(
                            child: TextField(
                              onChanged: (String str) {
                                if (str != '') {
                                  _debouncer.run(() {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SearchService(
                                        userInput: str,
                                      );
                                    }));
                                  });
                                }
                              },
                              style: TextStyle(color: lightGray),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Procurar um serviço',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  // BOTÃO QUE LEVA PARA O CADASTRO DE UM NOVO SERVIÇO
                  Ink(
                    decoration: ShapeDecoration(
                      color: mainPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add_rounded,
                        size: 30,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        print('Adicionar novo serviço pressionado');
                      },
                    ),
                  ),
                ],
              ),
              // Categorias
              SizedBox(
                height: 30,
              ),
              Text(
                'Categorias',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                        fundo: comida,
                        imagem: 'hotdog',
                        titulo: 'Comida',
                        descricao: 'Lanches, doces, kit festa e mais',
                        onPress: () {
                          print('Comida pressionado');
                        },
                      ),
                      CategoryCard(
                        fundo: musica,
                        imagem: 'piano',
                        titulo: 'Música & dança',
                        descricao: 'Instrumentos musicais, dança e mais',
                        onPress: () {
                          print('Piano pressionado');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                        fundo: escola,
                        imagem: 'notebook_S',
                        titulo: 'Escola',
                        descricao: 'Matemática, física, química, e mais',
                        onPress: () {
                          print('Escola pressionado');
                        },
                      ),
                      CategoryCard(
                        fundo: consertos,
                        imagem: 'box',
                        titulo: 'Consertos',
                        descricao: 'Encanamento, elétrica, móveis e mais',
                        onPress: () {
                          print('Consertos pressionado');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                        fundo: artes,
                        imagem: 'camera1',
                        titulo: 'Artes',
                        descricao: 'Pinturas, fotos, esculturas e mais',
                        onPress: () {
                          print('Artes pressionado');
                        },
                      ),
                      CategoryCard(
                        fundo: linguas,
                        imagem: 'talkBubble',
                        titulo: 'Línguas',
                        descricao: 'Inglês, espanhol, francês e mais',
                        onPress: () {
                          print('Línguas pressionado');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                        fundo: esporte,
                        imagem: 'weights',
                        titulo: 'Esporte',
                        descricao: 'Vôlei, futebol e mais',
                        onPress: () {
                          print('Esporte pressionado');
                        },
                      ),
                      CategoryCard(
                        fundo: beleza,
                        imagem: 'oculusSwift_S',
                        titulo: 'Beleza',
                        descricao: 'Costura, manicure, cabelo e mais',
                        onPress: () {
                          print('Beleza pressionado');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                        fundo: eletronicos,
                        imagem: 'laptop_S',
                        titulo: 'Eletrônicos',
                        descricao: 'Formatar PC, conserto, montar e mais',
                        onPress: () {
                          print('Eletrônicos pressionado');
                        },
                      ),
                      CategoryCard(
                        fundo: animais,
                        imagem: 'powSign_S',
                        titulo: 'Animais',
                        descricao: 'Banho, tosa, cuidados e mais',
                        onPress: () {
                          print('Animais pressionado');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryCard(
                        fundo: outros,
                        imagem: 'tea_S',
                        titulo: 'Outros',
                        descricao:
                            'O que não se encaixa nas outras categorias!',
                        onPress: () {
                          print('Outros pressionado');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
