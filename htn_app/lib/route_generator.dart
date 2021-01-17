import 'package:flutter/material.dart';
import 'package:htn_app/pages/home.dart';
import 'package:htn_app/pages/login-page.dart';
import 'package:htn_app/pages/profile-page.dart';
import 'package:htn_app/services/user.dart';
import 'package:htn_app/pages/error-page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Map args = settings.arguments;


    switch (settings.name) {
      case '/home':
        return _validateToRoute(args['user'],
            MaterialPageRoute(builder: (_) => HomePage())
        );
      case '/profile':
        return _validateToRoute(args['profile'],
            MaterialPageRoute(builder: (_) => ProfilePage(userID: args['profileUserID']))
        );
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
    }
  }

  static MaterialPageRoute _validateToRoute(User user, MaterialPageRoute pageRoute) {
    if (user==null) {
      return MaterialPageRoute(builder: (_) => LoginPage());
    }else {
      return pageRoute;
    }
  }
}