import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _formLoginKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                labelText: "Username", hintText: "Enter your username"),
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Username", hintText: "Enter your password"),
          ),
          RaisedButton(child: Text("Login"), onPressed: () => {})
        ],
      ),
    ));
  }
}
