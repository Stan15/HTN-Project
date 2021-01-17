import 'package:flutter/material.dart';
import 'package:htn_app/resources.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextField(
              decoration: TextInputFieldDecor("password")
            ),
            TextField(
              decoration: TextInputFieldDecor("password"),
            )
          ],
        ),
      ),
    );
  }
}
