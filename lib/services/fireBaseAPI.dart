import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAPI {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;

  FireBaseAPI (FirebaseUser user) {
    this.firebaseUser = user;
  }

  static Future<FireBaseAPI> signInWithEmail({@required String email,   @required String password,}) async {
    final FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email, password: password, );

    assert(user.email != null);
    //assert(user.displayName != null);

    //assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return FireBaseAPI(user);
  }

  static Future<FireBaseAPI> createUserWithEmailAndPassword({@required String email,   @required String password,}) async {
    final FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    assert(user.email != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    return FireBaseAPI(user);
  }


  static Future<void> signOut() async {
    return _auth.signOut();
  }

  static Future<FirebaseUser> currentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    return user;
  }
}