import 'package:flutter/material.dart';
import 'package:htn_app/services/user.dart';
import 'package:htn_app/widgets/dismissible_widget.dart';
import 'package:htn_app/widgets/profile-tile.dart';
import 'package:htn_app/resources.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> suggestedUsers = Resources.user.getSuggestions();

    void dismissItem(BuildContext context, int index, DismissDirection direction) {
      setState(() {
        suggestedUsers = Resources.user.removeUserSuggestion(suggestedUsers, suggestedUsers[index]);
      });

      switch (direction) {
        case DismissDirection.endToStart:
          Navigator.of(context).pushNamed('/profile', arguments: <String, dynamic> {'user': Resources.user, 'profileUserID': suggestedUsers[index]});
          break;
      }
    }

    return MaterialApp(
      title: "home",
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(Resources.appName),
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
