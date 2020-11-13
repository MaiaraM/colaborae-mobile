import 'package:colaborae/requests/http_request.dart';
import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';
import 'package:colaborae/components/tab_header.dart';
import 'package:colaborae/components/field.dart';
import 'package:colaborae/components/big_button.dart';
import 'package:colaborae/components/bottom_nav_bar.dart';

//TODO: Alterar tipo de campo: categoria deve ter uma lista para selecionar (tipo campo select do html), assim como preço e horário

class CadastroServico extends StatefulWidget {
  @override
  _CadastroServicoState createState() => _CadastroServicoState();
}

class _CadastroServicoState extends State<CadastroServico> {
  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  HttpRequest httpReq = HttpRequest();
  final tituloController = TextEditingController();
  final precoController = TextEditingController();
  final descController = TextEditingController();
  String titulo = '';
  String precoString = '';
  double preco;
  String desc = '';

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
                  // controller: ,
                  keyboardInputType: TextInputType.text,
                ),
                Spacing(20.0),
                Field(
                  label: 'Categoria',
                  hint: 'Escolha a categoria',
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: mainPurple,
                    size: 36,
                  ),
                  keyboardInputType: TextInputType.text,
                ),
                Spacing(20.0),
                Field(
                  label: 'Preço',
                  hint: 'Escolha o valor do serviço',
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: mainPurple,
                    size: 36,
                  ),
                  keyboardInputType: TextInputType.number,
                ),
                Spacing(20.0),
                Field(
                  label: 'Horário',
                  hint: 'Escolha um horário',
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: mainPurple,
                    size: 36,
                  ),
                  keyboardInputType: TextInputType.datetime,
                ),
                Spacing(20.0),
                Field(
                  label: 'Descrição',
                  hint:
                      'Adicione uma descrição ao seu serviço para que as pessoas entendam o serviço oferecido!',
                  lines: 6,
                  keyboardInputType: TextInputType.multiline,
                ),
                Spacing(30.0),
                BigButton(
                  text: 'CADASTRAR SERVIÇO',
                  onPressed: () {
                    print('Botão CADASTRAR SERVIÇO adicionado');
                  },
                ),
                Spacing(30.0),

                /*FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () async {
                    print('botão CADASTRAR SERVIÇO acionado');

                    titulo = tituloController.text;
                    precoString = precoController.text;
                    preco = double.parse(precoString);
                    desc = descController.text;

                    print('Titulo: ' + titulo);
                    print(precoString);
                    print('Descrição: ' + desc);

                    var response =
                        await httpReq.createService(titulo, desc, preco);
                    print(response);

                    setState(() {
                      tituloController.text = '';
                      precoController.text = '';
                      descController.text = '';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainPurple,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    //width: 250.0,
                    height: 60.0,
                    child: Center(
                      child: Text(
                        'CONCLUIR',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
