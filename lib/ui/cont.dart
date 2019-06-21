import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:istoria_romaniei/services/fireBaseAPI.dart';
import 'package:istoria_romaniei/home.dart';
import 'package:istoria_romaniei/ui/register.dart';

import 'login.dart';

class Cont extends StatefulWidget {
  @override
  _Cont createState() => _Cont();
}

class _Cont extends State<Cont> {

  bool _isLoading = true;
  String email = 'Not Logged In';

  Future _getUser() async {
    FirebaseUser user = await FireBaseAPI.currentUser();
    setState(() {
      email = user.email;
      _isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {

    _getUser();

    return Scaffold(
      appBar: AppBar(title: Text("Login with Firebase Auth")),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('You are logged in as'),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(email),

            ),
            RaisedButton(
              child: Text("SignUp"),
              onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => RegisterWithFirebaseAuth()));},
            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => LoginWithFirebaseAuth()));},
            ),
            RaisedButton(
              child: Text("Sign Out"),
              onPressed: () {FireBaseAPI.signOut(); setState(() {
                email = 'Not Logged In';
              });},
            ),
          ],
        ),
      ),
    );
  }
}