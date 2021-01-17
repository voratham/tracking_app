import "package:flutter/material.dart";
import '../pages/dashboard.dart';
import '../models/user.model.dart';
import "../domain/auth.domain.dart";

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  User user;
  bool loading = false;

  @override
  initState() {
    super.initState();
    authDomain.getUser().then((response) {
      if (response) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DasdhboradPage()));
      }
    }).catchError((error) {
      print(error);
    });
  }

  Future<void> _showDialogError(String title) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error Login'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(title),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void handleOnSubmit() async {
    setState(() {
      loading = true;
    });
    if (_formLoginKey.currentState.validate()) {
      authDomain
          .login(userNameController.text, userPasswordController.text)
          .then((response) {
        setState(() {
          loading = false;
        });
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DasdhboradPage()));
      }).catchError((error) {
        setState(() {
          loading = false;
        });
        return this._showDialogError(error.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      key: _formLoginKey,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: <Widget>[
          FlutterLogo(
            size: 100,
          ),
          TextFormField(
            controller: userNameController,
            validator: (value) {
              return value.isEmpty ? "Enter your username" : null;
            },
            decoration: InputDecoration(
                labelText: "Username", hintText: "Enter your username"),
          ),
          TextFormField(
            controller: userPasswordController,
            obscureText: true,
            obscuringCharacter: "*",
            validator: (value) {
              return value.isEmpty ? "Enter your password" : null;
            },
            decoration: InputDecoration(
                labelText: "Password", hintText: "Enter your password"),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              child: Text("Sign In"),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: loading ? null : () => handleOnSubmit())
        ]),
      ),
    ));
  }
}
