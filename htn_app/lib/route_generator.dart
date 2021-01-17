import 'package:flutter/material.dart';
import 'package:htn_app/pages/home.dart';
import 'package:htn_app/pages/signin-page.dart';
import 'package:htn_app/pages/profile-page.dart';
import 'package:htn_app/pages/error-page.dart';
import 'package:htn_app/resources.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map args = settings.arguments;


    switch (settings.name) {
      case '/home':
        return _validateToRoute(
            MaterialPageRoute(builder: (_) => HomePage())
        );
      case '/profile':
        return _validateToRoute(
            MaterialPageRoute(builder: (_) => ProfilePage(userID: args['profileUserID']))
        );
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }

  static MaterialPageRoute _validateToRoute(MaterialPageRoute pageRoute) {
    if (Resources.user==null) {
      return MaterialPageRoute(builder: (_) => SigninPage());
    }else {
      return pageRoute;
    }
  }
}