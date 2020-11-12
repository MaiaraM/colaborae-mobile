import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';

class BigButton extends StatelessWidget {
  BigButton({@required this.text, @required this.route});

  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Botão grande roxo de ação pressionado');
        Navigator.pushNamed(context, '/$route');
      },
      child: Container(
        decoration: BoxDecoration(
          color: mainPurple,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 60.0,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
        ),
      ),
    );
  }
}
