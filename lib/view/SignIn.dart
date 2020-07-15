import 'package:Academicmaster/pages/posts.dart';
import 'package:Academicmaster/view/chatrooms.dart';
import 'package:Academicmaster/view/forgot_password.dart';
import 'package:Academicmaster/view/helper/helperfunction.dart';
import 'package:Academicmaster/view/helper/theme.dart';
import 'package:Academicmaster/view/viewservices/auth.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatRoom()));
        } else {
          setState(() {
            isLoading = false;
            //show snackbar
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Academic master",
      style: GoogleFonts.quicksand(
          textStyle: Theme.of(context).textTheme.display1,
          fontWeight: FontWeight.w700,

          fontSize: 45,color: Color(0xffffce00)),

      ),
      centerTitle: true,
      bottom: PreferredSize(
        child: Text("The simplest way to success",
        style: GoogleFonts.fondamento(fontSize: 20,color: Colors.white),),
        preferredSize: Size.fromHeight(50.0),
      ),
        /*flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.green,
                    Color(0xff2782bb)
                  ])
          ),
        ),*/
        backgroundColor: Color(0xff484d5c),
      ),
       backgroundColor:Colors.white,
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
                      child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Image.network(
                      "https://cdn.dribbble.com/users/2367833/screenshots/7816190/media/b1aaf5c98510012b56422d1619dc62e8.gif",
                      width: 400,
                      height: 200,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                      ? null
                                      : "Please Enter Correct Email";
                                },
                                controller: emailEditingController,
                                style: simpleTextStyle(),
                                decoration: textFieldInputDecoration("email"),
                              ),
                            ],
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (val) {
                              return val.length > 6
                                  ? null
                                  : "Enter Password 6+ characters";
                            },
                            style: simpleTextStyle(),
                            controller: passwordEditingController,
                            decoration: textFieldInputDecoration("password"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyApps()));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                "Forgot Password?",
                                style: simpleTextStyle(),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
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
                               // const Color(0xff007EF4),
                               // const Color(0xff2A75BC)
                               Colors.brown[200],
                               Colors.yellow[300]
                              ],
                            )),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Sign In",
                          style: biggerTextStyle(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(vertical: 16),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       color: Colors.white),
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Text(
                    //     "Sign In with Google",
                    //     style: TextStyle(
                    //         fontSize: 17, color: CustomTheme.textColor),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account? ",
                          style: simpleTextStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: _urllauncher,
                        child:Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),

                        )),
                        FlatButton(
                            onPressed: _terms,
                            child:Text(
                              "Terms And Condition",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),

                            )
                        )
                      ],

                    ),
                    Row(
                      children: <Widget>[
                        Container(constraints: BoxConstraints(maxWidth: 300),
                            child:
                        Text("By continuing you agree to our terms of service and privacy policy",
                        style: TextStyle(color: Colors.black),)
                        ),],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
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