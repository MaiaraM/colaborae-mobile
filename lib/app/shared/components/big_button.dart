import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';

class BigButton extends StatelessWidget {
  BigButton({@required this.text, this.onPressed, this.loading = false});

  final String text;
  final bool loading;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: mainPurple,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 60.0,
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    letterSpacing: 1.0,
                  ),
                ),
        ),
      ),
    );
  }
}
