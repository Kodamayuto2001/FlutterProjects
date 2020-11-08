import 'package:flutter/material.dart';
import 'package:flutter_app6/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0, // 親に対してこのマテリアルを配置するz座標
        title: Text("Sign in to Sample App"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text("Sign in annon"),
          onPressed: () async {
            // await _auth.signInAnon();
            dynamic result = await _auth.signInWithGoogle();
            // if (result == null) {
            //   print(result.uid);
            //   print("error signing in");
            // } else {
            //   print("signed in");
            //   print(result.uid);
            // }
            print(result);
          },
        ),
      ),
    );
  }
}
