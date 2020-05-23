
import "package:flutter/material.dart";

import "package:google_sign_in/google_sign_in.dart";
import 'package:firebase_auth/firebase_auth.dart';

class Loginuser extends StatefulWidget {
  @override
  _LoginuserState createState() => _LoginuserState();
}

class _LoginuserState extends State<Loginuser> {
  bool _islogin = false;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _login() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      print(googleAuth.idToken);

      setState(() {
        _islogin = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();

    setState(() {
      _islogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "user profile",
          style: TextStyle(
              fontSize: 40, fontFamily: "Dancing", fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: _islogin
            ? SingleChildScrollView(
                child: Container(
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 130,
                        backgroundImage: AssetImage("images/thirdgif3.gif"),
                      ),
                      Box(60, 20),
                      Image.network(
                        _googleSignIn.currentUser.photoUrl,
                      ),
                      Box(20, 20),
                      Row(
                        children: <Widget>[
                          Text(
                            "User name: ",
                            style: TextStyle(
                                fontSize: 40,
                                fontFamily: "Dancing",
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _googleSignIn.currentUser.displayName,
                            style: TextStyle(
                                fontSize: 40,
                                fontFamily: "Dancing",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Box(20, 20),
                      Row(
                        children: <Widget>[
                          Text(
                            "User email: ",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Dancing",
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _googleSignIn.currentUser.email,
                            style: TextStyle(
                                fontSize: 23,
                                fontFamily: "Dancing",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Box(20, 20),
                      Container(
                        color: Colors.red,
                        child: FlatButton(
                          child: Text("Logout"),
                          onPressed: () {
                            _logout();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )

            //if user is not logged in then this is run

            : SingleChildScrollView(
                child: Container(
                  color: Colors.orange,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Box(60, 60),
                            CircleAvatar(
                                radius: 140,
                                backgroundImage: AssetImage("images/pic1.png")),
                            Box(20, 20),
                            Center(
                              child: Text(
                                "Create a new account ",
                                style: TextStyle(
                                    fontFamily: "Dancing",
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Box(20, 20),
                            Center(
                              child: Text(
                                "OR ",
                                style: TextStyle(
                                    fontFamily: "Dancing",
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Box(20, 20),
                            Center(
                              child: Text(
                                "Login in TheMitian",
                                style: TextStyle(
                                    fontFamily: "Dancing",
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Box(30, 30),
                            Container(
                              child: FlatButton(
                                color: Colors.green,
                                child: Text(
                                  "login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                                onPressed: () {
                                  _login();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

SizedBox Box(double x, double y) {
  return SizedBox(height: x, width: y);
}



