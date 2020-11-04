import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';

class Comecar extends StatefulWidget {
  @override
  _ComecarState createState() => _ComecarState();
}

class _ComecarState extends State<Comecar> {
  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPurple,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacing(25.0),
                //CircleAvatar(
                //  radius: 70.0,
                //  backgroundColor: Colors.deepPurpleAccent,
                //  backgroundImage: AssetImage('images/gift_50px.png'),
                //  //TODO: alterar imagem (imagem do protótipo é uma caixa aberta)
                //),
                Image(
                  image: AssetImage('images/imagens/start_element.png'),
                  width: 300,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15.0, 25.0, 45.0, 15.0),
                  child: Text(
                    'Encontre e ofereça serviços na sua região.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 34.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15.0, 15.0, 45.0, 50.0),
                  child: Text(
                    'Com o Colaboraê você encontra serviços disponibilizados pelas pessoas na sua região. Assim você não precisa ir muito longe para encontrar o que você deseja!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 3.0),
                  child: InkWell(
                    splashColor: mainPurple,
                    onTap: () {
                      Navigator.pushNamed(context, '/cadastro_servico');
                      //TODO 03/11/2020 Henrique: criado novo botão de cadastro (para testagem da funcionalidade, retirar quando definir as rotas e as navegações de telas)
                      //COMEÇAR button action here
                    },
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'Cadastrar Serviço',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
                Spacing(20.0),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 3.0),
                  child: InkWell(
                    splashColor: mainPurple,
                    onTap: () {
                      Navigator.pushNamed(context, '/buscar_servico');
                      //TODO 03/11/2020 Henrique: nome do botão, de 'começar' para "buscar serviço"
                      //COMEÇAR button action here
                    },
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'Buscar Serviço',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
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
