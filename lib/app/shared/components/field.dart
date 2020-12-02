import 'package:flutter/material.dart';
import 'package:colaborae/app/shared/utils/constants.dart';
import 'package:flutter/services.dart';

class Field extends StatelessWidget {
  Field({
    @required this.label,
    this.hint,
    this.showText,
    this.icon,
    this.lines,
    this.controller,
    this.keyboardInputType,
    this.readOnly = false,
  });

  final String label;
  final bool showText;
  final bool readOnly;
  final String hint;
  final Widget icon;
  final int lines;
  final TextEditingController controller;
  final TextInputType keyboardInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      enabled: !readOnly,
      maxLines: lines,
      controller: controller,
      obscureText: showText != null ? showText : false,
      enableSuggestions: label == 'Senha' ? false : true,
      autocorrect: label == 'Senha' ? false : true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: lightGray,
        ),
        labelText: label,
        labelStyle: TextStyle(color: readOnly ? Colors.grey : Colors.black),
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
      style: TextStyle(color: readOnly ? Colors.grey : Colors.black),
    );
  }
}
