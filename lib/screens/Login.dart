import 'package:flutter/material.dart';
import 'package:loginflow/providers/LoginProvider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  
  static const route = "/login";

  final String name;

  LoginScreen(this.name);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  LoginNotifier notifier;

  @override
  void initState() {
    super.initState();
    print("Hello");
    notifier = Provider.of<LoginNotifier>(context, listen: false);
    notifier.addListener(this.loginListener);
  }

  @override
  void dispose() {
    print("Removing event listeners");
    notifier.removeListener(this.loginListener);
    super.dispose();
  }

  void loginListener() {
    if (notifier.isLoggedIn && notifier.status == LoginStatus.LOGIN_SUCCESSFULL) {
      print("There is a change in notifier state"+notifier.isLoggedIn.toString()+notifier.status.toString());
      Navigator.pushNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Text("Welcome ${widget.name}", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
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
              RaisedButton(
                child: Consumer<LoginNotifier>(
                  builder: (context, value, child) => 
                  value.status == LoginStatus.LOGIN_LOADING? CircularProgressIndicator(): Text("Login"),
                ),
                onPressed: () {
                  notifier.loginUser(_emailController.text, _passwordController.text);
                },
              ),
              SizedBox(height: 20),
              Consumer<LoginNotifier>(
                builder: (context, value, child) => 
                value.status == LoginStatus.LOGIN_UNSUCCESSFULL? 
                Text("Invalid email or password", style: TextStyle(color: Colors.red, fontSize: 30))
                : Container(),
              )
            ],
          )
        )
      )
    );
  }
}