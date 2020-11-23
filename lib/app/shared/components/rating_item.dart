import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:colaborae/app/shared/utils/constants.dart';

class RatingItem extends StatelessWidget {
  RatingItem({
    @required this.title,
    @required this.userName,
    @required this.comment,
    this.date,
    this.price,
    this.ratingStars,
    this.onPress,
  });

  final String title;
  final String userName;
  final String comment;
  final double price;
  final String
      date; // Mudar o tipo da variável para DateTime ou algum compatível
  final Widget ratingStars;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: lighterGray,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '$userName',
                        style: TextStyle(
                          fontSize: 14,
                          color: gray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SvgPicture.asset(
                        'images/svg/four-half-stars.svg',
                        width: 90.0,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'R\$ $price',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '$date',
                        style: TextStyle(
                          fontSize: 14,
                          color: gray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '$comment',
                style: TextStyle(
                  color: lightGray,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
