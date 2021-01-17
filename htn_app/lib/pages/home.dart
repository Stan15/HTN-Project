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
    var _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          // You're at the top.
        } else {
          setState(() {
            Resources.user.addSuggestions(suggestedUsers);
          });
        }
      }
    });

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

    return Scaffold(
        appBar: AppBar(
          title: Text(Resources.appName),
        ),
        body: ListView.separated(
          controller: _controller,
          itemCount: suggestedUsers.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final profileUserID = suggestedUsers[index];
            return DismissibleWidget(
              item: profileUserID,
              child: ProfileTile(userID: profileUserID,),
              onDismissed: (direction) { dismissItem(context, index, direction);},
            );
          },
        )
    );
  }
}
