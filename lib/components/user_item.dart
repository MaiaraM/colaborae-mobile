import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class UserItem extends StatelessWidget {
  UserItem(
      {this.backgroundColor,
      this.image,
      @required this.title,
      @required this.description,
      this.onPress});

  final Color backgroundColor;
  final String image;
  final String title;
  final String description;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // height original dos serviços = 107
        // height dos usuários = 150+
        height: 170.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: lighterGray,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'images/profiles/pfp1.png',
                  ),
                ),
              ),
              SizedBox(
                width: 13,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$description',
                        style: TextStyle(
                          fontSize: 14,
                          color: lightGray,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              /*Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    'images/svg/$rating.svg',
                    width: 75,
                    color: yellow,
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
