import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import './providers/LoginProvider.dart';
import './navigation/AuthScreens.dart';
import './navigation/MainScreens.dart';
import './bloc/LoginBloc.dart';
import './inheritedwrapper.dart';

class MainAppWrapper extends StatelessWidget {
  // final LoginBloc logBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    final LoginBloc logBloc = InheritedWrapper.of(context).logBloc;
    return StreamBuilder(
      stream: logBloc.tokenController.stream,
      initialData: "",
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData && snapshot.data.isNotEmpty) {
          return HomeScreens();
        }
        else {
          return AuthScreens();
        }
      },
    );
  }
}

// class InheritedWrapper extends InheritedWidget {
//   final LoginBloc logBloc;

//   InheritedWrapper({this.logBloc, Widget child}): super(child: child);

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) {
//     return true;
//   }

//   static InheritedWrapper of (BuildContext context) =>
//     context.dependOnInheritedWidgetOfExactType();  

// }

class MainApp extends StatelessWidget {
  final LoginBloc logBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return InheritedWrapper(
      child: MainAppWrapper(),
      logBloc: logBloc,
    );
  }
}