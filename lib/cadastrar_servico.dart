import 'package:colaborae/requests/http_request.dart';
import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';

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

  Widget Field(String label, String hint, int lines, controller) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLines: lines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              labelText: label,
              isDense: true,
              contentPadding: EdgeInsets.all(15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  httpRequest httpReq = httpRequest();
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacing(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back,
                        color: Colors.deepPurpleAccent,
                        size: 35.0,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Novo Serviço!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0,
                      ),
                    ),
                  ],
                ),
                Spacing(30.0),
                Field('Título do Serviço', '', 1, tituloController),
                Spacing(25.0),
                Field('Valor por hora', 'Exemplo: 29.99 (sem R\$)', 1, precoController),
                Spacing(25.0),
                Field('Descrição', 'Adicione uma descrição e horários do seu serviço para que as pessoas entendam o que você está oferecendo!', 6, descController),
                Spacing(50.0),
                FlatButton(
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

                    var response = await httpReq.createService(titulo, desc, preco);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
