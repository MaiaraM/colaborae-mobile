import 'package:colaborae/app/modules/user/controllers/user_controller.dart';
import 'package:colaborae/app/shared/components/service_item.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:colaborae/app/modules/service/models/service_model.dart';
import 'package:colaborae/app/modules/login/controllers/auth_controller.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final userController = Modular.get<UserController>();
  final authController = Modular.get<AuthController>();
  List<ServiceModel> servicesRes = [];

  @override
  void initState() {
    super.initState();
    if (userController.user == null) userController.getUserLogin();
    userController.getServiceByUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: Observer(
            builder: (_) {
              if (userController.loading) {
                return CircularProgressIndicator();
              }

              if (userController.user != null) {
                return SingleChildScrollView(
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
                                '${userController.user.firstName},',
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
                          Row(
                            children: [
                              Ink(
                                decoration: ShapeDecoration(
                                  color: lightPink,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.info, color: mainPurple),
                                  onPressed: () =>
                                      Modular.to.pushNamed("/user_info"),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Ink(
                                decoration: ShapeDecoration(
                                  color: lightPink,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.power_settings_new,
                                    color: red,
                                  ),
                                  // Logout
                                  onPressed: () {
                                    try {
                                      authController.logout();
                                      Modular.to.pushNamed("/login");
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                //height: 220.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    'images/profiles/pfp1.png',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Container(
                                //height: 220.0,
                                decoration: BoxDecoration(
                                  color: lightBlue,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            '${userController.user.description}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              height: 1.15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      /*Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                    ),*/
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Observer(
                        builder: (_) {
                          if (userController.services != null) {
                            List<Widget> servicesList = [];

                            for (int i = 0;
                                i < userController.services.length;
                                i++) {
                              var title, description, price;

                              title = userController.services[i].title;
                              description =
                                  userController.services[i].description;
                              price = userController.services[i].value;

                              servicesList.add(ServiceItem(
                                  backgroundColor: outros,
                                  image: 'imagens/tea_S.png',
                                  title: title,
                                  description: description,
                                  price: price,
                                  onPress: () {
                                    print('Serviço selecionado.');
                                  }));

                              servicesList.add(SizedBox(height: 15));
                            }
                            if (servicesList.length == 0) {
                              return Text(
                                "Você ainda não oferece serviços.",
                                style: TextStyle(fontSize: 18, color: gray),
                              );
                            }
                            return SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: servicesList,
                              ),
                            );
                          } else {
                            return Container(
                              child: Text("Erro ao carregar"),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: Text("Erro ao carregar"),
                );
              }
            },
          ),
        ),
        //bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
