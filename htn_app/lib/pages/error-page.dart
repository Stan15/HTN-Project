import 'package:flutter/material.dart';
import 'package:htn_app/styles.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {Navigator.of(context).pop();},
        ),
      ),
      body: Container(

      ),
    );
  }
}
