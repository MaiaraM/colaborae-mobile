import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';
//import 'package:colaborae/components/bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:colaborae/components/service_item.dart';
//import 'package:colaborae/components/rating_item.dart';

class WorkerProfile extends StatefulWidget {
  @override
  _WorkerProfileState createState() => _WorkerProfileState();
}

class _WorkerProfileState extends State<WorkerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Viviane',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Carvalho Alves',
                          style: TextStyle(
                            fontSize: 22,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Ink(
                      decoration: ShapeDecoration(
                        color: lightPink,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.flag,
                          color: red,
                        ),
                        onPressed: () {
                          print('Botão denunciar pressionado');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 220.0,
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(10.0),
                        /*boxShadow: [
                          BoxShadow(
                            color: darkPurple.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2),
                          )
                        ],*/
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'images/profiles/pfp2.jpg',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 220.0,
                        decoration: BoxDecoration(
                          color: lightBlue,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Descrição',
                                    style: TextStyle(
                                      color: darkPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Sou estudante de música, toco piano e violino e dou aulas de música. Entre em contato comigo para combinarmos local e horário das aulas!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      height: 1.15,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nota média',
                                    style: TextStyle(
                                      color: darkPurple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'images/svg/five-stars.svg',
                                        color: darkPurple,
                                        width: 90.0,
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        '5.0',
                                        style: TextStyle(
                                          color: darkPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Serviços oferecidos',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text('Sliders'),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    ServiceItem(
                      backgroundColor: musica,
                      image: 'piano',
                      title: 'Aula de piano',
                      description:
                          'Aulas de piano e teoria musical. Segundas e Quintas',
                      price: 25.0,
                      rating: '5.0',
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    ServiceItem(
                      backgroundColor: comida,
                      image: 'hotdog',
                      title: 'Kit festa',
                      description:
                          'Kit festa delicinha por vintão, coxinha, bolinha de queijo',
                      price: 25.0,
                      rating: '5.0',
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    /*RatingItem(
                      title: 'Donuts',
                      userName: 'Rafaela Pinheiro',
                      comment:
                          'Podemos já vislumbrar o modo pelo qual o fenômeno da internet ainda não demonstrou convincentemente que vai participar na mudança do impacto na agilidade decisória.',
                      price: 100,
                      date: '13/11/2020',
                    ),*/
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
