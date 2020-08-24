import 'package:Academicmaster/pages/posts.dart';
import 'package:Academicmaster/view/chatrooms.dart';
import 'package:Academicmaster/view/forgot_password.dart';
import 'package:Academicmaster/view/helper/helperfunction.dart';
import 'package:Academicmaster/view/helper/theme.dart';
import 'package:Academicmaster/view/viewservices/auth.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:Academicmaster/view/widgets/widget.dart';

import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn(this.toggleView);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  String userid;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          QuerySnapshot userInfoSnapshot =
              await DatabaseMethods().getUserInfo(emailEditingController.text);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              userInfoSnapshot.documents[0].data["userName"]);
          HelperFunctions.saveUserEmailSharedPreference(
              userInfoSnapshot.documents[0].data["userEmail"]);

          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => HomPage()));
             getCurrentUser();
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

   getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });

    addnewuserprofile();
  }


  addnewuserprofile() async {
    await Firestore.instance
        .collection("userprofile")
        .document(userid)
        .setData({
      "profileimageurl":
          "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
      // "contact": "Not provides",
      // "username": "Abc",
      "bio": "None",
      "userName": "abc ",
      "userEmail": "abc@gmail.com",
      "userphonenumber":"1234567",
      "usercollege": "bcd",
      "userbranch":"none ",
      "follower":0,
      "following":0,
      "useryear": "not mention",
      "github": "https://github.com",
      "linkdin": "https://www.linkedin.com/home",
      "insta": "https://www.instagram.com",
      'time': DateTime.now().millisecondsSinceEpoch,
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomPage()));
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
                      child: SafeArea(
                child: Container(
                  //padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Container(
                        height: size.height * 0.3,
                        child: Stack(children: [
                          Center(
                            child: Image(
                              image: AssetImage(
                                "images/login.png",
                              ),
                              height: size.height * 0.35,
                            ),
                          ),
                          SizedBox(width: 40),
                          Row(children: [
                            Image(
                              image: AssetImage(
                                "images/main_top.png",
                              ),
                              height: 90,
                            ),
                          ]),
                        ]),
                      ),

                      Container(
                        height: size.height * 0.3,
                        padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                        child: Form(
                          key: formKey,
                          child:SingleChildScrollView(child: Column(
                            children: [

                             
                              Text(
                                "Academic Master",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Dancing",
                                  color: Color(0xFF6F35A5),
                                ),
                              ),
                              Text(
                                "A Simple way Of Success",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: "Dancing",
                                  color: Color(0xFF6F35A5),
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF1E6FF),
                                      borderRadius: BorderRadius.circular(29),
                                    ),
                                    child: TextFormField(
                                      validator: (val) {
                                        return RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(val)
                                            ? null
                                            : "Please Enter Correct Email";
                                      },
                                      controller: emailEditingController,
                                      style: simpleTextStyle(),
                                      // decoration: textFieldInputDecoration("email"),
                                      decoration: InputDecoration(
                                          icon: Icon(Icons.person),
                                          hintText: "Email",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  // color: kPrimaryLightColor,
                                  color: Color(0xFFFF1E6FF),
                                  borderRadius: BorderRadius.circular(29),
                                ),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (val) {
                                    return val.length > 6
                                        ? null
                                        : "Enter Password 6+ characters";
                                  },
                                  style: simpleTextStyle(),
                                  controller: passwordEditingController,
                                  //decoration: textFieldInputDecoration("password"),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.remove_red_eye),
                                      hintText: "Password",
                                      border: InputBorder.none),
                                ),
                              ),
                              //SizedBox(height:20),

                             
                            ],
                        )),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                signIn();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF6F35A5),
                                        Color(0xFF6F35A5)
                                      ],
                                    )),
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text("Sign In",
                                    //style: biggerTextStyle(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have account? ",
                              //style: simpleTextStyle(),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Dancing",
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              widget.toggleView();
                            },
                            child: Text("Register now",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Dancing",
                                    color: Colors.purpleAccent,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),

                      Container(
                        height: size.height * 0.1,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: <Widget>[
                            Card(
                              child: FlatButton(
                                  onPressed: _urllauncher,
                                  child: Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Card(
                              child: FlatButton(
                                  onPressed: _terms,
                                  child: Text(
                                    "Terms & Condition",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 35, right: 25),
                        child: Row(
                          children: <Widget>[
                            Container(
                                constraints: BoxConstraints(maxWidth: 300),
                                child: Text(
                                    "By continuing you agree to our terms of service and privacy policy",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Dancing",
                                      color: Colors.black,
                                    ))),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                    ],
                  ),
                ),
              ),
          ),
    );
  }
}

_urllauncher() async {
  const url = 'https://academic-master.flycricket.io/privacy.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_terms() async {
  const url = 'https://academic-master.flycricket.io/terms.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
