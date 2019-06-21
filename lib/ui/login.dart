import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:istoria_romaniei/services/fireBaseAPI.dart';
import 'package:istoria_romaniei/home.dart';
import 'package:istoria_romaniei/ui/register.dart';

class LoginWithFirebaseAuth extends StatefulWidget {
  @override
  _LoginWithFirebaseAuthState createState() => _LoginWithFirebaseAuthState();
}

class _LoginWithFirebaseAuthState extends State<LoginWithFirebaseAuth> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  Future<bool> _loginUser(String email, String password) async {
    final api = await FireBaseAPI.signInWithEmail(email: email, password: password,);
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
      appBar: AppBar(title: Text("Login with Firebase Auth")),
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
              child: Text("Login"),
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
            RaisedButton(
              child: Text("SignUp"),
              onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => RegisterWithFirebaseAuth()));},
            )
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