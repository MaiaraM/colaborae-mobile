import 'package:colaborae/main.dart';
import 'package:colaborae/constants.dart';
import 'package:flutter/material.dart';

class TabHeader extends StatelessWidget {
  TabHeader({this.icon, @required this.title, this.actionButton});

  final IconData icon;
  final String title;
  final IconData actionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            icon,
            size: 30,
            color: mainPurple,
          ),
        ),
        Text(
          '$title',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Ink(
          decoration: ShapeDecoration(
            color: mainPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: IconButton(
            icon: Icon(
              actionButton,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () {
              print('Botão filtrar serviços adicionado');
            },
          ),
        ),
      ],
    );
  }
}
