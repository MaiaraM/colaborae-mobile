import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Sobre o Colaboraê',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          'Encontre e ofereça serviços de todos os tipos sua região!',
                          style: TextStyle(
                            fontSize: 25,
                            height: 1.3,
                          ),
                        )),
                    SizedBox(
                      width: 45,
                    ),
                    Expanded(
                      flex: 1,
                      child: Image.asset('images/imagens/tea_S.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Com o Colaboraê você encontra serviços disponibilizados pelas pessoas na sua região. Assim você não precisa ir muito longe para encontrar o que precisa!',
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'Entre em contato conosco através do nosso e-mail:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainPurple,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'dara.silva3@fatec.sp.gov.br',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Icon(
                  Icons.thumb_up,
                  color: mainPurple,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
