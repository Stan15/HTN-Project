import 'package:flutter/material.dart';
import 'package:htn_app/services/profile-data.dart';

class ProfileTile extends StatelessWidget {
  String userID;
  String imgUrl;
  String username;
  String description;

  ProfileTile({@required this.userID}) {
    this.imgUrl = ProfileData.getImgUrl(this.userID);
    this.username = ProfileData.getUsername(this.userID);
    this.description = ProfileData.getDescription(this.userID);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: this.imgUrl=="" ? NetworkImage(this.imgUrl) :NetworkImage(this.imgUrl),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(this.description),
        ],
      ),
      onTap: () {},
    );
  }
}
