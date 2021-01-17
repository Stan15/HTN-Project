import 'package:flutter/material.dart';
import 'package:htn_app/services/user.dart';
import 'package:htn_app/widgets/dismissible_widget.dart';
import 'package:htn_app/widgets/profile-tile.dart';

class HomePage extends StatefulWidget {
  final String title = 'mysapp3';
  User user = User("hisd9e0r2h");

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> suggestedUsers = widget.user.getSuggestions();

    void dismissItem(BuildContext context, int index, DismissDirection direction) {
      setState(() {
        suggestedUsers = widget.user.removeUserSuggestion(suggestedUsers, suggestedUsers[index]);
      });

      switch (direction) {
        case DismissDirection.endToStart:
          Navigator.of(context).pushNamed('/profile', arguments: <String, dynamic> {'user': widget.user, 'profileUserID': suggestedUsers[index]});
          break;
      }
    }

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
          body: ListView.separated(
            itemCount: suggestedUsers.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final profileUserID = suggestedUsers[index];
              return DismissibleWidget(
                item: profileUserID,
                child: ProfileTile(userID: profileUserID,),
                onDismissed: (direction) => dismissItem(context, index, direction),
              );
            },
          )
      ),
    );
  }
}
