import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  void dispose();
}

enum LoginState {LoginIdle, LoginLoading, LoginSuccessfull, LoginUnsuccessfull}

class LoginBloc extends BaseBloc {

  final String baseUrl = "https://reqres.in/api/login";
  final BehaviorSubject<LoginState> loginController = BehaviorSubject<LoginState>();
  final BehaviorSubject<String> tokenController = BehaviorSubject<String>();

  LoginBloc() {
    loginController.add(LoginState.LoginIdle);
    tokenController.add("");
  }

  void loginUser(String email, String password) async {
    loginController.add(LoginState.LoginLoading);
    final response = await http.post(baseUrl, 
      body: jsonEncode({
        "email": email,
        "password": password
      }),
      headers: {"Content-Type": "application/json"}
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data["token"]);
      tokenController.add(data["token"].toString());
      loginController.add(LoginState.LoginSuccessfull);
    }
    else {
      loginController.add(LoginState.LoginUnsuccessfull);
      await Future<void>.delayed(Duration(seconds: 2));
      loginController.add(LoginState.LoginIdle);
    }
  }

  void logoutUser() {
    tokenController.add("");
  }

  @override
  void dispose() async {
    await loginController.close();
    await tokenController.close();
  }
}