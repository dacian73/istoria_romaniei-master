import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:istoria_romaniei/ui/login.dart';

import '../home.dart';


class AuthVerification extends StatelessWidget{

  Widget _handleCurrentScreen() {
    return new StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new WaitingScreen();
          } else {
            if (snapshot.hasData) {
              return new MyHomePage();
            }
            return new LoginWithFirebaseAuth();
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _handleCurrentScreen();
  }


}

class WaitingScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("Waiting to load");
  }

}