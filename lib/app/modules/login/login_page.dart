import 'package:colaborae/app/shared/auth/auth_controller.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:colaborae/app/shared/components/big_button.dart';
import 'package:colaborae/app/shared/components/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Modular.get<AuthController>();

  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String email = '';
  String senha = '';
  String message = '';
  bool showPassword = false;

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
                  Observer(builder: (_) {
                    return !loginController.loading &&
                            loginController.auth_token != null &&
                            !loginController.auth_token
                        ? Text(
                            "Ops! Alguma informação está incorreta",
                            style: TextStyle(color: Colors.deepOrange),
                          )
                        : SizedBox(
                            height: 2,
                          );
                  }),
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
                    showText: showPassword,
                    icon: GestureDetector(
                      onTap: () => setState(() {
                        showPassword = !showPassword;
                      }),
                      child: Icon(
                        showPassword ? Icons.lock : Icons.remove_red_eye,
                        color: gray,
                      ),
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
                          Modular.to.pushNamed('/user_register');
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
                  Observer(builder: (_) {
                    return loginController.loading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: 2,
                          );
                  }),
                  BigButton(
                    text: 'ENTRAR',
                    onPressed: () async {
                      await makeLogin();
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

  Future<void> makeLogin() async {
    await loginController.login(emailController.text, senhaController.text);
    if (loginController.auth_token) {
      Modular.to.pushNamed("/");
    }
  }
}
