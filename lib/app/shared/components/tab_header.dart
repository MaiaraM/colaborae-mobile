import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabHeader extends StatelessWidget {
  TabHeader(
      {this.icon,
      @required this.title,
      @required this.haveButton,
      this.actionButton});

  final IconData icon;
  final String title;
  final bool haveButton;
  final String actionButton;

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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '$title',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        haveButton
            ? Ink(
                decoration: ShapeDecoration(
                  color: mainPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    'images/svg/$actionButton.svg',
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print('Botão filtrar serviços adicionado');
                  },
                ),
              )
            : SizedBox(
                width: 40,
              ),
      ],
    );
  }
}
