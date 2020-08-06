import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/LoginProvider.dart';
import './navigation/AuthScreens.dart';
import './navigation/MainScreens.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, value, child) {
        if (value.isLoggedIn) {
          return HomeScreens();
        }
        else if (!value.isLoggedIn) {
          return AuthScreens();
        }
        return null;
      },
    );
  }
}