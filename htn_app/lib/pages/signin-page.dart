import 'package:flutter/material.dart';
import 'package:htn_app/resources.dart';
import 'package:flutter/widgets/widgets.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextField(
              decoration: TextInputFieldDecor("password")
            ),
            TextField(
              decoration: TextInputFieldDecor("password"),
          ],
        ),
      ),
    );
  }
}
