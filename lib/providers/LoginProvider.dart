import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

enum LoginStatus {LOGIN_IDLE, LOGIN_LOADING, LOGIN_SUCCESSFULL, LOGIN_UNSUCCESSFULL}

class LoginNotifier extends ChangeNotifier {
  bool isLoggedIn = false;
  dynamic token;
  LoginStatus status = LoginStatus.LOGIN_IDLE;

  void loginUser(String email, String password) async {
    setLoginStatus(LoginStatus.LOGIN_LOADING);
    final String url = "https://reqres.in/api/login";
    final response = await http.post(
      url, 
      body: jsonEncode({
      "email": email,
      "password": password
      }),
      headers: {"Content-Type": "application/json"}
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      token = data["token"];
      isLoggedIn = true;
      setLoginStatus(LoginStatus.LOGIN_SUCCESSFULL);

    }
    else {
      print("Login Unsuccesfull");
      isLoggedIn = false;
      setLoginStatus(LoginStatus.LOGIN_UNSUCCESSFULL);
      await Future<void>.delayed(Duration(seconds: 2));
      setLoginStatus(LoginStatus.LOGIN_IDLE);
    }
  }

  void setLoginStatus(LoginStatus newStatus) {
    status = newStatus;
    notifyListeners();
  }

  void logoutUser() {
    isLoggedIn = false;
    notifyListeners();
  }

}