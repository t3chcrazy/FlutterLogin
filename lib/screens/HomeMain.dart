import 'package:flutter/material.dart';
import 'package:loginflow/bloc/LoginBloc.dart';
import 'package:loginflow/providers/LoginProvider.dart';
import 'package:provider/provider.dart';
import '../inheritedwrapper.dart';

class HomeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBloc logBloc = InheritedWrapper.of(context).logBloc;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text("Home screen"),
          // Consumer<LoginNotifier>(
          //   builder: (context, value, child) {
          //     return RaisedButton(
          //       child: Text("Logout"),
          //       onPressed: () => value.logoutUser(),
          //     );
          //   },
          // )
          RaisedButton(
            child: Text("Logout"),
            onPressed: () => logBloc.logoutUser()
          )
        ],
      )
    );
  }
}