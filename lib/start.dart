import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';

class StartingPage extends StatefulWidget {
  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  Widget Spacing(double h) {
    return SizedBox(
      height: h,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('images/imagens/start_element.png'),
                Spacing(20.0),
                Text(
                  'Encontre e ofereça serviços na sua região.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 34.0,
                    color: Colors.white,
                  ),
                ),
                Spacing(10.0),
                Text(
                  'Com o Colaboraê você encontra serviços disponibilizados pelas pessoas na sua região. Assim você não precisa ir muito longe para encontrar o que você deseja!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                Spacing(30.0),
                Card(
                  color: Colors.white,
                  child: InkWell(
                    splashColor: mainPurple,
                    onTap: () {
                      Navigator.pushNamed(context, '/service_register');
                      //TODO 03/11/2020 Henrique: criado novo botão de cadastro (para testagem da funcionalidade, retirar quando definir as rotas e as navegações de telas)
                      //COMEÇAR button action here
                    },
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'Criar Serviço',
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
                // Card(
                //   color: Colors.white,
                //   child: InkWell(
                //     splashColor: mainPurple,
                //     onTap: () {
                //       Navigator.pushNamed(context, '/user_register');
                //       //COMEÇAR button action here
                //     },
                //     child: ListTile(
                //       title: Center(
                //         child: Text(
                //           'Cadastrar Usuário',
                //           style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 20.0,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       trailing: Icon(Icons.arrow_forward),
                //     ),
                //   ),
                // ),
                // Spacing(20.0),
                Card(
                  color: Colors.white,
                  child: InkWell(
                    splashColor: mainPurple,
                    onTap: () {
                      Navigator.pushNamed(context, '/search_user');
                      //COMEÇAR button action here
                    },
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'Ver Perfis Ativos',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
