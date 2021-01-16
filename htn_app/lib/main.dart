import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final String title = 'mysapp3';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Profile> users = {
    new Profile(
      name: "Stan",
      description: "Hello, my name is stan and i am doing stuff",
    )
  }

  }

  Widget userPreview(user) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.account_circle
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(user.name),
                Text(user.description),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: widget.title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: [

                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
