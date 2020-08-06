import 'package:flutter/material.dart';
import '../arguments/LoginScreen.dart';

class SignUpScreen extends StatelessWidget {

  static const routeName = "/signup";

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: Text("Sign up")
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.verified_user),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Password is required";
                    }
                    else if (value.length < 6) {
                      return "Password length must be greater than 6";
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  child: Text("Sign up"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.pushNamed(context, "/login", arguments: LoginScreenArguments(_nameController.text));
                    }
                  }
                )
              ],
            )
          )
        )
      )
    );
  }
}