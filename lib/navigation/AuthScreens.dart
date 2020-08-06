import 'package:flutter/material.dart';
import '../screens/SignUp.dart';
import '../screens/Login.dart';
import '../arguments/LoginScreen.dart';

class AuthScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/signup",
      onGenerateRoute: (settings) {
        if (settings.name == SignUpScreen.routeName) {
          return MaterialPageRoute(
            builder: (context) => SignUpScreen(),
          );
        }
        else if (settings.name == LoginScreen.route) {
          final LoginScreenArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => LoginScreen(args.name),
          );
        }
        return null;
      },
    );
  }
}