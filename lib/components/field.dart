import 'package:flutter/material.dart';
import 'package:colaborae/constants.dart';

class Field extends StatelessWidget {
  Field({
    @required this.label,
    this.hint,
    this.icon,
    this.controller,
    this.keyboardInputType,
  });

  final String label;
  final String hint;
  final Widget icon;
  final TextEditingController controller;
  final TextInputType keyboardInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: label == 'Senha' ? true : false,
      enableSuggestions: label == 'Senha' ? false : true,
      autocorrect: label == 'Senha' ? false : true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: lightGray,
        ),
        labelText: label,
        labelStyle: TextStyle(color: gray),
        isDense: true,
        contentPadding: EdgeInsets.all(20.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lighterGray,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainPurple,
            width: 2,
          ),
        ),
        suffixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: keyboardInputType,
    );
  }
}
