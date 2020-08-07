import 'package:flutter/material.dart';
import '../inheritedwrapper.dart';

import '../bloc/LoginBloc.dart';

class LoginWithBloc extends StatelessWidget {

  static const route = "/login";

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final String name;

  // final LoginBloc logBloc = LoginBloc();

  LoginWithBloc(this.name);

  @override
  Widget build(BuildContext context) {
    final LoginBloc logBloc = InheritedWrapper.of(context).logBloc;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("Login Screen")
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Welcome ${this.name}", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.verified_user),
                ),
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Password is required";
                  }
                  else if (value.length < 6) {
                    return "Password length should be 6 characters or more";
                  }
                  return null;
                },
              ),
              StreamBuilder(
                stream: logBloc.loginController.stream,
                builder: (context, snapshot) => snapshot.data == LoginState.LoginLoading? 
                RaisedButton(
                  child: FittedBox(child: CircularProgressIndicator()),
                  onPressed: () {},
                ):
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () => logBloc.loginUser(_emailController.text, _passwordController.text),
                )
              ),
              SizedBox(height: 20),
              StreamBuilder(
                stream: logBloc.loginController.stream,
                builder: (context, snapshot) => snapshot.data == LoginState.LoginUnsuccessfull?
                Text("Invalid email or password", style: TextStyle(color: Colors.red, fontSize: 30)):
                Container(),
              )
            ],
          )
        )
      )
    );
  }
}