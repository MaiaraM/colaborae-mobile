import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _activeItemIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BottomNavBarItem(icon: 'compass', index: 0, route: 'start'),
        BottomNavBarItem(icon: 'search', index: 1, route: 'buscar_servico'),
        BottomNavBarItem(
            icon: 'receipt_long-24px', index: 2, route: 'user_register'),
        BottomNavBarItem(icon: 'user', index: 3, route: 'login'),
      ],
    );
  }

  Widget BottomNavBarItem({String icon, int index, String route}) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          height: 50,
          decoration: index == _activeItemIndex
              ? BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      mainPurple.withOpacity(1.0),
                      mainPurple.withOpacity(0.65),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  color: index == _activeItemIndex ? mainPurple : Colors.white,
                )
              : BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
            child: SvgPicture.asset(
              'images/svg/$icon.svg',
              color: index == _activeItemIndex ? Colors.white : mainPurple,
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/$route');
          setState(() {
            _activeItemIndex = index;
          });
        },
      ),
    );
  }
}
