import 'package:colaborae/app/modules/user/controllers/user_controller.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:colaborae/app/shared/components/tab_header.dart';
import 'package:colaborae/app/modules/login/controllers/auth_controller.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final userController = Modular.get<UserController>();
  final authController = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabHeader(
                  icon: Icons.arrow_back,
                  title: 'Sobre mim',
                  haveButton: false,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dados pessoais',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: lightPink,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset('images/svg/edit.svg'),
                            onPressed: () =>
                                Modular.to.pushNamed("/user_register"),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Ink(
                          decoration: ShapeDecoration(
                            color: lightPink,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                              icon: Icon(
                                Icons.delete_forever,
                                size: 24,
                                color: red,
                              ),
                              onPressed: () {
                                try {
                                  userController
                                      .deleteUser(userController.user.uuid);
                                  authController.logout();
                                  Modular.to.pushNamed("/login");
                                } catch (e) {
                                  print(e);
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                PersonalDataInfo(
                  label: 'Nome completo',
                  data:
                      '${userController.user.firstName} ${userController.user.lastName}',
                ),
                SizedBox(
                  height: 10.0,
                ),
                PersonalDataInfo(
                  label: 'E-mail',
                  data: '${userController.user.email}',
                ),
                SizedBox(
                  height: 10.0,
                ),
                PersonalDataInfo(
                  label: 'CPF',
                  data: '${userController.user.document}',
                ),
                SizedBox(
                  height: 10.0,
                ),
                PersonalDataInfo(
                  label: 'Descrição',
                  data: '${userController.user.description}',
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Endereço',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                PersonalDataInfo(
                  label: 'Endereço',
                  data: '${userController.user.address.address}',
                ),
                SizedBox(
                  height: 10.0,
                ),
                PersonalDataInfo(
                    label: 'CEP',
                    data: '${userController.user.address.zipcode}'),
                SizedBox(
                  height: 10.0,
                ),
                PersonalDataInfo(
                    label: 'Cidade',
                    data:
                        '${userController.user.address.city}, ${userController.user.address.state}'),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersonalDataInfo extends StatelessWidget {
  PersonalDataInfo({@required this.label, @required this.data});

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: lightPurple,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          data,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
