import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.comfortable,
        fontFamily: 'Poppins',
      ),
      initialRoute: '/login',
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
