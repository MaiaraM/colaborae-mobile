import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';
import 'package:colaborae/components/field.dart';
import 'package:colaborae/components/big_button.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final ruaController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();

  String nome = '';
  String sobrenome = '';
  String email = '';
  String cpf = '';
  String rua = '';
  String bairro = '';
  String cidade = '';
  String estado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/imagens/gift_50px.png',
                ),
                Spacing(10.0),
                Text(
                  'Faça seu cadastro',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                  ),
                ),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Dados pessoais',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacing(15.0),
                Field(
                  label: 'Nome',
                  hint: 'Digite seu primeiro nome',
                  icon: Icon(
                    Icons.person,
                    color: gray,
                  ),
                  controller: nomeController,
                  keyboardInputType: TextInputType.name,
                ),
                Spacing(20.0),
                Field(
                  label: 'Sobrenome',
                  hint: 'Digite sua senha',
                  icon: Icon(
                    Icons.lock,
                    color: gray,
                  ),
                  controller: sobrenomeController,
                  keyboardInputType: TextInputType.name,
                ),
                Spacing(20.0),
                Field(
                  label: 'E-mail',
                  hint: 'Digite seu e-mail',
                  icon: Icon(
                    Icons.alternate_email,
                    color: gray,
                  ),
                  controller: emailController,
                  keyboardInputType: TextInputType.emailAddress,
                ),
                Spacing(20.0),
                Field(
                  label: 'CPF',
                  hint: 'Digite seu CPF',
                  icon: Icon(
                    Icons.accessibility,
                    color: gray,
                  ),
                  controller: cpfController,
                  keyboardInputType: TextInputType.number,
                ),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Endereço',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500))
                  ],
                ),
                Spacing(20.0),
                Row(
                  children: [
                    Expanded(
                      child: Field(
                        label: 'Rua',
                        hint: 'Digite a rua da sua casa',
                        controller: ruaController,
                        keyboardInputType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Field(
                        label: 'Bairro',
                        hint: 'Digite o seu bairro',
                        controller: bairroController,
                        keyboardInputType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                Spacing(20.0),
                Row(
                  children: [
                    Expanded(
                      child: Field(
                        label: 'Cidade',
                        hint: 'Ex: Rio de Janeiro',
                        controller: cidadeController,
                        keyboardInputType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Field(
                        label: 'Estado',
                        hint: 'Ex: SP',
                        controller: estadoController,
                        keyboardInputType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                Spacing(40.0),
                BigButton(
                  text: 'CADASTRAR',
                  onPressed: () {
                    nome = nomeController.text;
                    sobrenome = sobrenomeController.text;
                    email = emailController.text;
                    cpf = cpfController.text;
                    rua = ruaController.text;
                    bairro = bairroController.text;
                    cidade = cidadeController.text;
                    estado = estadoController.text;
                    setState(() {
                      nome = '';
                      sobrenome = '';
                      email = '';
                      cpf = '';
                      rua = '';
                      bairro = '';
                      cidade = '';
                      estado = '';
                    });
                    print('BOTÃO CADASTRAR PRESSIONADO');
                    Navigator.pushNamed(context, '/buscar_servico');
                  },
                ),
                Spacing(20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
