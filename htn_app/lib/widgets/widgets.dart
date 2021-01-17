import 'package:flutter/material.dart';
import 'package:htn_app/resources.dart';

Widget AppBarMain(BuildContext context) {
  return AppBarMain(
    title: Resources.appName,
  );
}

InputDecoration TextInputFieldDecor(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
        color: Resources.hintColor
    ),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Resources.hintColor)
    ),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Resources.hintColor)
    ),
  );
}