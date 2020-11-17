import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';

class ServiceItem extends StatelessWidget {
  ServiceItem(
      {this.backgroundColor,
      this.image,
      @required this.title,
      @required this.description,
      @required this.price,
      this.rating,
      this.onPress});

  final Color backgroundColor;
  final String image;
  final String title;
  final String description;
  final double price;
  final String rating;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // height original dos serviços = 107
        // height dos usuários = 150+
        height: 200.0,
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
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: backgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('images/$image'),
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
                        ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'R\$ $price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '$rating',
                    style: TextStyle(
                      color: yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
