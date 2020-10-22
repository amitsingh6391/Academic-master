import 'package:Academicmaster/pages/posts.dart';

import 'package:Academicmaster/view/SignUp.dart';
import 'package:Academicmaster/pages/homescreen.dart';
import 'package:Academicmaster/view/helper/helperfunction.dart';

import 'package:Academicmaster/view/viewservices/auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/material.dart";
import 'package:Academicmaster/view/widgets/widget.dart';

import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  FirebaseFirestore db = FirebaseFirestore.instance;

  bool isLoading = false;
  String userid;

  @override
  void initState() {
    checkUserAuth();
    super.initState();
  }

  checkUserAuth() async {
    try {
      User user = await auth.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homescreen(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  signin() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
        print("yes");
      });

      auth
          .signInWithEmailAndPassword(
              email: emailEditingController.text,
              password: passwordEditingController.text)
          .then((authResult) async {
        // register fcm token
        String fcmToken = await firebaseMessaging.getToken();

        User user = authResult.user;

        db.collection("userstoken").doc(user.uid).set({
          "email": user.email,
          "fcmToken": fcmToken,
          "profilepic":
              "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
          "username": user.email,
          "userid": user.uid
        });

        // for topic
        firebaseMessaging.subscribeToTopic("btech");
        firebaseMessaging.subscribeToTopic("bpharma");
        firebaseMessaging.subscribeToTopic("dpharma");
        firebaseMessaging.subscribeToTopic("post");
        firebaseMessaging.subscribeToTopic("bcom");
        firebaseMessaging.subscribeToTopic("bse");
        firebaseMessaging.subscribeToTopic("notice");
        firebaseMessaging.subscribeToTopic("motivation");

        // for unsubscribe
        //firebaseMessaging.unsubscribeFromTopic("news");

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => UserScreen(),
        //   ),
        // );
        getCurrentUser();
      }).catchError((error) {
        showMessage("Alert!", "Provide details");
      });
    }
  }

  showMessage(title, description) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(title),
            content: Text(description),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Dismiss"),
              )
            ],
          );
        });
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });

    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('logedin', "yes");
    preferences.setInt('back', 0xFF000000);
    preferences.setInt('words', 0xFFFFFFFF);

    HelperFunctions.saveUserNameSharedPreference(emailEditingController.text);
    HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Homescreen()));
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
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 20),
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
                      height: size.height * 0.35,
                      padding: EdgeInsets.only(left: 20, top: 30, right: 20),
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                            child: Column(
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
                              signin();
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
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

//homscreenalluserswill be here...

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  List<DocumentSnapshot> users;

  @override
  void initState() {
    fetchUsers();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showMessage("Notification", "$message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        showMessage("Notification", "$message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        showMessage("Notification", "$message");
      },
    );

    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: false),
      );
    }

    super.initState();
  }

  fetchUsers() async {
    QuerySnapshot snapshot = await db.collection("userstoken").get();
    setState(() {
      users = snapshot.docs;
    });
  }

  showMessage(title, description) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(title),
            content: Text(description),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Dismiss"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((a) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignIn(),
                  ),
                );
              });
            },
          ),
        ],
      ),
      body: Container(
        child: users != null
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(users[index]
                            .data()["email"]
                            .toString()
                            .substring(0, 1)),
                      ),
                      title: Text(users[index].data()["email"]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NotificationScreen(to: users[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: users.length,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

//notification screen

class NotificationScreen extends StatefulWidget {
  final DocumentSnapshot to;

  NotificationScreen({
    @required this.to,
  });

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController _messageController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    User u = await auth.currentUser;
    setState(() {
      user = u;
    });
  }

  handleInput(String input) {
    print(input);

    db
        .collection("userstoken")
        .doc(widget.to.id)
        .collection("notifications")
        .add({
      "message": input,
      "title": user.email,
      "date": FieldValue.serverTimestamp()
    }).then((doc) {
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.to.data()["email"]),
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: "Write message here",
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: handleInput(_messageController.text),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  handleInput(_messageController.text);
                },
                child: Icon(Icons.send),
              )
            ],
          ),
        ),
      ),
    );
  }
}
