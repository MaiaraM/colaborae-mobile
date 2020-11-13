import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';
import 'package:colaborae/components/field.dart';
import 'package:colaborae/components/big_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/imagens/gift_50px.png',
              ),
              Spacing(10.0),
              Text(
                'Logue e colabore aê!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 1.0,
                ),
              ),
              Spacing(30.0),
              Field(
                label: 'E-mail',
                hint: 'Digite seu e-mail',
                icon: Icon(
                  Icons.alternate_email,
                  color: gray,
                ),
                lines: 1,
                keyboardInputType: TextInputType.emailAddress,
              ),
              Spacing(20.0),
              Field(
                label: 'Senha',
                hint: 'Digite sua senha',
                icon: Icon(
                  Icons.lock,
                  color: gray,
                ),
                lines: 1,
                keyboardInputType: TextInputType.emailAddress,
              ),
              Spacing(15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não possui uma conta?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.0,
                    ),
                  ),
                  FlatButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pushNamed(context, '/user_register');
                    },
                    child: Text(
                      'Cadastre-se!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: mainPurple,
                        fontSize: 16.0,
                        decoration: TextDecoration.underline,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              Spacing(15.0),
              BigButton(
                text: 'ENTRAR',
                onPressed: () {
                  email = emailController.text;
                  senha = senhaController.text;
                  setState(() {
                    email = '';
                    senha = '';
                  });
                  print('BOTÃO ENTRAR PRESSIONADO');
                  Navigator.pushNamed(context, '/buscar_servico');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
