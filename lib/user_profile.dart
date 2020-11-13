import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';
import 'package:colaborae/components/bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:colaborae/components/service_item.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
                          'Olívia,',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'bem-vinda!',
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
                        icon: SvgPicture.asset('images/svg/edit.svg'),
                        onPressed: () {
                          print('Editar perfil pressionado');
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
                          'images/profiles/pfp1.png',
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
                      'Meus serviços',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                    Text('Sliders'),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionChip(
                      onPressed: () {
                        print('Recentes pressionado');
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 41.0),
                      backgroundColor: mainPurple,
                      label: Text('Recentes'),
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                    ActionChip(
                      onPressed: () {
                        print('Antigos pressionado');
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 41.0),
                      backgroundColor: Colors.white,
                      label: Text('Antigos'),
                      labelStyle: TextStyle(
                          color: gray,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
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
                    ServiceItem(
                      backgroundColor: comida,
                      image: 'hotdog',
                      title: 'Aula de piano',
                      description:
                          'Aulas de piano e teoria musical. Segundas e Quintas',
                      price: 25.0,
                      rating: '5.0',
                    ),
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
