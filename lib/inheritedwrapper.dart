import 'package:flutter/material.dart';
import './bloc/LoginBloc.dart';

class InheritedWrapper extends InheritedWidget {
  final LoginBloc logBloc;

  InheritedWrapper({this.logBloc, Widget child}): super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static InheritedWrapper of (BuildContext context) =>
    context.dependOnInheritedWidgetOfExactType();  

}