import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  Widget Spacing(double h){
    return SizedBox(
      height: h,
    );
  }

  Widget Field(String label, String hint){
    return Column(
      children: <Widget>[
        // Container(
        //   margin: EdgeInsets.all(2.0),
        //   width: 250.0,
        //   child: Text(title,
        //     textAlign: TextAlign.left,
        //     style: TextStyle(
        //       fontFamily: 'Poppins',
        //       fontWeight: FontWeight.bold,
        //       fontSize: 14.0,
        //     ),
        //   ),
        // ),
        //TODO: label text em cima da borda (???)
        //TODO: focus border color
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
                Spacing(20.0),
                CircleAvatar(
                  radius: 55.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/gift_50px.png'),
                ),
                Spacing(10.0),
                Text('Faça seu cadastro!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    letterSpacing: 1.0,
                  ),
                ),
                Spacing(30.0),
                Field('Nome Completo', 'Digite seu nome completo'),
                Spacing(25.0),
                Field('E-Mail', 'exemplo@email.com.br'),
                Spacing(25.0),
                Field('Senha', 'Senha entre 6 e 12 caracteres'),
                Spacing(25.0),
                Field('Endereço', 'Digite seu endereço completo'),
                Spacing(30.0),
                FlatButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: (){
                    print('botão CRIAR CONTA acionado');
                    //SIGN UP button action here
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: 250.0,
                    height: 60.0,
                    child: Center(
                      child: Text('CRIAR CONTA',
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
