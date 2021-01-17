import 'package:flutter/material.dart';
import 'package:htn_app/route_generator.dart';
import 'package:htn_app/resources.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Resources.appName,
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
