import 'dart:async';

import 'package:colaborae/app/shared/auth/auth_controller.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreenPage> {
  final authController = Modular.get<AuthController>();

  @override
  void initState() {
    super.initState();
    authController.logout();
    authController.getIsAuth();
    Timer(Duration(seconds: 5), () {
      Modular.to.pushNamed("/start");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPurple,
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(
            Images.LOGO_TEXTO,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
