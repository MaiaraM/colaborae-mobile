import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Widget Spacing(double h){
    return SizedBox(
      height: h,
    );
  }

  Widget Field(String label, String hint){
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              labelText: label,
              isDense: true,
              contentPadding: EdgeInsets.all(15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)
                ),
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
                Spacing(35.0),
                CircleAvatar(
                  radius: 55.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/gift_50px.png'),
                  //TODO: alterar imagem de login
                ),
                Spacing(10.0),
                Text('Logue e colabore aê!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    letterSpacing: 1.0,
                  ),
                ),
                Spacing(50.0),
                Field('Login', ''),
                Spacing(30.0),
                Field('Senha', ''),
                Spacing(30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Não possui uma conta?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                      ),
                    ),
                    FlatButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: (){
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      child: Text('Cadastre-se!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent,
                          fontSize: 16.0,
                          decoration: TextDecoration.underline,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacing(30.0),
                FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: (){
                    print('botão LOGAR acionado');
                    Navigator.pushNamed(context, '/comecar');
                    //button action here
                    //TODO: Próxima tela é o mapa e não '/começar'
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 250.0,
                    height: 60.0,
                    child: Center(
                      child: Text('ENTRAR',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            letterSpacing: 2.0,
                            color: Colors.white
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
