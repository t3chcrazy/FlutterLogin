import 'package:flutter/material.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("Home screen"),
          RaisedButton(
            child: Text("Logout"),
            onPressed: () {},
          )
        ],
      )
    );
  }
}