import 'package:flutter/material.dart';

class Comecar extends StatefulWidget {
  @override
  _ComecarState createState() => _ComecarState();
}

class _ComecarState extends State<Comecar> {

  Widget Spacing(double h){
    return SizedBox(
      height: h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacing(60.0),
                CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.deepPurpleAccent,
                  backgroundImage: AssetImage('images/gift_50px.png'),
                  //TODO: alterar imagem (imagem do protótipo é uma caixa aberta)
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15.0, 50.0, 45.0, 15.0),
                  child: Text('Encontre e ofereça serviços na sua região.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15.0, 15.0, 45.0, 50.0),
                  child: Text('Com o Colaboraê você encontra serviços disponibilizados'
                      ' pelas pessoas na sua região. Assim você não precisa ir muito longe'
                      ' para encontrar o que você deseja!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(70.0, 10.0, 70.0, 3.0),
                  child: InkWell(
                    splashColor: Colors.deepPurple.shade100,
                    onTap: (){
                      print('botão COMEÇAR acionado');
                      //COMEÇAR button action here
                    },
                    child: ListTile(
                      title: Center(
                        child: Text('COMEÇAR',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward),
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
