import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:istoria_romaniei/services/fireBaseAPI.dart';
import 'package:istoria_romaniei/home.dart';

class RegisterWithFirebaseAuth extends StatefulWidget {
  @override
  _RegisterWithFirebaseAuthState createState() => _RegisterWithFirebaseAuthState();
}

class _RegisterWithFirebaseAuthState extends State<RegisterWithFirebaseAuth> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<bool> _loginUser(String email, String password) async {
    final api = await FireBaseAPI.createUserWithEmailAndPassword(email: email, password: password,);
    if (api != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("SignUp with Firebase")),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            RaisedButton(
              child: Text("SignUp"),
              color: Colors.red,
              onPressed: () async {
                setState(() => _isLoading = true);

                bool b = await _loginUser(
                    _emailController.text, _passwordController.text);
                setState(() => _isLoading = false);
                if (b == true) {
                  Navigator.of(context).push(MaterialPageRoute<Null>(
                      builder: (BuildContext context) {
                        return new MyHomePage();
                      }));
                } else {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Wrong email or")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Center(
        child: StreamBuilder(
            stream: FirebaseAuth.instance.currentUser().asStream(),
            builder:
                (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
              if (!snapshot.hasData) {
                return Text("You are not logged In");
              }
              return Text("Logged in \n \n Email: ${snapshot.data.email}");
            }),
      ),
    );
  }
}