import 'package:flutter/material.dart';
import 'package:htn_app/services/profile-data.dart';

class ProfilePage extends StatelessWidget {
  String userID;
  String imgUrl;
  String username;
  String description;

  ProfilePage({@required this.userID}) {
    this.imgUrl = ProfileData.getImgUrl(this.userID);
    this.username = ProfileData.getUsername(this.userID);
    this.description = ProfileData.getDescription(this.userID);
  }

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
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: this.imgUrl=="" ? NetworkImage(this.imgUrl) :NetworkImage(this.imgUrl),
                    ),
                  ),
                )
              ),
            ),
            Center(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: Text(
                        this.username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      )
                    ),
                  )
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        child: Text(this.description)
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
