import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:colaborae/app/shared/components/tab_header.dart';
import 'package:colaborae/app/shared/components/field.dart';
import 'package:colaborae/app/shared/components/big_button.dart';
import 'package:colaborae/app/shared/repositories/BaseRepository.dart';
import 'package:colaborae/app/modules/user/controllers/user_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:convert';

import 'models/service_model.dart';

class CadastroServico extends StatefulWidget {
  @override
  _CadastroServicoState createState() => _CadastroServicoState();
}

final titleController = TextEditingController();
var categoryController;
final priceController = TextEditingController();
DateTime timeController;
final descController = TextEditingController();

Future<ServiceModel> createService() async {
  final userController = Modular.get<UserController>();
  ServiceModel service = new ServiceModel(
    title: titleController.text,
    description: descController.text,
    value: double.parse(priceController.text),
  );
}

class _CadastroServicoState extends State<CadastroServico> {
  final userController = Modular.get<UserController>();

  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  String title = '';
  String category = '';
  String priceStr = '';
  double price;
  DateTime time;
  String desc = '';

  List<String> categories = [
    'Comida',
    'Música & dança',
    'Escola',
    'Consertos',
    'Artes',
    'Línguas',
    'Esporte',
    'Beleza',
    'Eletrônicos',
    'Animais',
    'Outros'
  ];

  String selectedCategory = "Comida";

  /*Future _pickTime() async {
    DateTime horario = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2022));
    if (horario != null) {
      setState(() {
        timeController = horario;
        print(timeController);
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: padding,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabHeader(
                  icon: Icons.arrow_back,
                  title: 'Novo serviço',
                  haveButton: false,
                ),
                Spacing(20.0),
                Text(
                  'Preencha os campos abaixo para contribuir com um novo serviço na sua região!',
                  style: TextStyle(color: gray, fontSize: 15),
                ),
                Spacing(20.0),
                Field(
                  label: 'Título do serviço',
                  hint: 'O título deve ser breve e sucinto',
                  keyboardInputType: TextInputType.text,
                  controller: titleController,
                ),
                Spacing(20.0),
                Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 2, color: lighterGray),
                  ),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    isDense: true,
                    isExpanded: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: mainPurple,
                      size: 36,
                    ),
                    value: selectedCategory,
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                        categoryController = value;
                      });
                    },
                    items: categories.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ),
                Spacing(20.0),
                Field(
                  label: 'Preço',
                  hint: 'Escolha o valor do serviço',
                  keyboardInputType: TextInputType.number,
                  controller: priceController,
                ),
                Spacing(20.0),
                /*GestureDetector(
                  onTap: _pickTime,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: lighterGray, width: 2),
                    ),
                    child: ListTile(
                      trailing: Icon(
                        Icons.calendar_today,
                        color: mainPurple,
                      ),
                    ),
                  ),
                ),
                Spacing(20.0),*/
                Field(
                  label: 'Descrição',
                  hint:
                      'Adicione uma descrição ao seu serviço para que as pessoas entendam o serviço oferecido!',
                  lines: 6,
                  keyboardInputType: TextInputType.multiline,
                  controller: descController,
                ),
                Spacing(30.0),
                BigButton(
                  text: 'CADASTRAR SERVIÇO',
                  onPressed: () async {
                    print('botão CADASTRAR SERVIÇO acionado');

                    title = titleController.text;
                    print(title);
                    priceStr = priceController.text;
                    price = num.tryParse(priceStr)?.toDouble();
                    print(price);
                    desc = descController.text;
                    print(desc);
                    category = categoryController;
                    //time = timeController;
                    try {
                      ServiceModel service = await createService();
                    } catch (e) {
                      print(e);
                    }

                    Navigator.pushNamed(context, '/buscar_servico');
                  },
                ),
                Spacing(30.0),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
