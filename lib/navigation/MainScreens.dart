import 'package:flutter/material.dart';
import '../screens/Home.dart';

class HomeScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/main/home",
      onGenerateRoute: (settings) {
        if (settings.name == HomeScreen.route)
          return MaterialPageRoute(
            builder: (context) => HomeScreen(),
          );
        return null;
      },
    );
  }
}