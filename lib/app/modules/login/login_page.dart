import 'package:colaborae/app/shared/auth/auth_controller.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:colaborae/app/shared/components/big_button.dart';
import 'package:colaborae/app/shared/components/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginRepository = Modular.get<AuthController>();

  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  // Future loginUser(String email, String senha) async {
  //   final String baseUrl = 'https://api-colaborae.herokuapp.com/login/';
  //
  //   try {
  //     Map<String, String> headers = {"Content-type": "application/json"};
  //     var body = jsonEncode({
  //       "email": email,
  //       "password": senha,
  //     });
  //
  //     var response = await http.post(baseUrl, headers: headers, body: body);
  //     if (response.statusCode == 201) {
  //       print('Login feito com sucesso.');
  //       Navigator.pushNamed(context, '/buscar_servico');
  //       return response;
  //     } else {
  //       print('Falha ao logar.');
  //       print(response.statusCode);
  //       setState(() {
  //         message = 'Falha ao logar.';
  //       });
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String email = '';
  String senha = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: Center(
            child: SingleChildScrollView(
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
                    controller: emailController,
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
                    controller: senhaController,
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
                  Text(
                    message,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacing(20.0),
                  BigButton(
                    text: 'ENTRAR',
                    onPressed: () async {
                      email = emailController.text;
                      senha = senhaController.text;
                      setState(() {
                        message = 'Por favor, aguarde...';
                      });
                      var login = loginRepository.login(email, senha);
                      print(login);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
