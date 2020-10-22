import 'dart:io';

import 'package:Academicmaster/pages/homescreen.dart';
import 'package:Academicmaster/pages/posts.dart';
import 'package:Academicmaster/view/viewservices/auth.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:Academicmaster/view/widgets/widget.dart';
import 'package:firebase_storage/firebase_storage.dart';

import "package:flutter/material.dart";
import "package:Academicmaster/view/SignIn.dart";

import "package:Academicmaster/view/helper/helperfunction.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  TextEditingController collegeEditingController = new TextEditingController();
  TextEditingController phoneEditingController = new TextEditingController();
  TextEditingController branchEditingController = new TextEditingController();
  TextEditingController yearEditingController = new TextEditingController();
  TextEditingController refer = new TextEditingController();

  AuthService authService = new AuthService();

  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String userid;

  FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  FirebaseFirestore db = FirebaseFirestore.instance;

  File selected1Image;

  var profilemageUrl;
  final picker = ImagePicker();
  DateTime now = DateTime.now();
  Future<void> getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    cropImage(image);
  }

  Future<void> getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    cropImage(image);
  }

  cropImage(var image) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path, compressQuality: 40);

    setState(() {
      selected1Image = croppedImage;
    });
  }

  singUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      StorageReference firebaseStorageRefe = FirebaseStorage.instance
          .ref()
          .child("userprofilepic")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask tasks =
          firebaseStorageRefe.putFile(selected1Image);

      profilemageUrl = await (await tasks.onComplete).ref.getDownloadURL();
      print("this is url $profilemageUrl");

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('name', usernameEditingController.text);
      preferences.setString('profilepic', profilemageUrl);

      await AuthService.signUp(
              emailEditingController.text, passwordEditingController.text)
          .then((result) async {
        if (result != null) {
          print("okie yes");

          HelperFunctions.saveUserNameSharedPreference(
              usernameEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);

          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('logedin', "yes");
          preferences.setInt('back', 0xFF000000);
          preferences.setInt('words', 0xFFFFFFFF);

          getCurrentUser();
        } else {
          print("result");
          print(result);
        }
      });
    }

    // uploaduserprofile();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    //final UserCredential user = await _auth.currentUser();
    User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });

    addnewuserprofile();
  }

  addnewuserprofile() async {
    // register fcm token
    String fcmToken = await firebaseMessaging.getToken();

    // User user = result.user;

    db.collection("userstoken").doc(userid).set({
      "email": emailEditingController.text,
      "profilepic": profilemageUrl,
      "username": usernameEditingController.text,
      "fcmToken": fcmToken,
      "userid": userid
    });

    // for topic
    firebaseMessaging.subscribeToTopic("promotion");
    firebaseMessaging.subscribeToTopic("news");
    firebaseMessaging.subscribeToTopic("btech");
    firebaseMessaging.subscribeToTopic("bpharma");
    firebaseMessaging.subscribeToTopic("dpharma");
    firebaseMessaging.subscribeToTopic("post");
    firebaseMessaging.subscribeToTopic("bcom");
    firebaseMessaging.subscribeToTopic("bse");
    firebaseMessaging.subscribeToTopic("notice");
    firebaseMessaging.subscribeToTopic("motivation");

    // for unsubscribe
    // firebaseMessaging.unsubscribeFromTopic("news");

    await FirebaseFirestore.instance.collection("userprofile").doc(userid).set({
      "profileimageurl": profilemageUrl,
      "bio": "None",
      "userName": usernameEditingController.text,
      "userEmail": emailEditingController.text,
      "userphonenumber": phoneEditingController.text,
      "usercollege": collegeEditingController.text,
      "userbranch": branchEditingController.text,
      "useryear": yearEditingController.text,
      "refer": refer.text,
      "follower": 0,
      "following": 0,
      "github": "https://github.com",
      "linkdin": "https://www.linkedin.com/home",
      "insta": "https://www.instagram.com",
      'time': DateTime.now().millisecondsSinceEpoch,
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Homescreen()));
  }

  @override
  void initState() {
    //checkUserAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      //  resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomPadding: false,
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
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
                              "images/signup.png",
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
                    SingleChildScrollView(
                      child: Container(
                        //height: size.height * 0.69,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: formKey,
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
                              // Text(
                              //   "Academic Master",
                              //   style: TextStyle(
                              //     fontSize: 30,
                              //     fontWeight: FontWeight.bold,
                              //     fontFamily: "Dancing",
                              //     color: Color(0xFF6F35A5),
                              //   ),
                              // ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Create a new Account:",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Dancing",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF6F35A5),
                                    ),
                                  )
                                ],
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
                                          icon: Icon(Icons.mail),
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
                                  validator: (val) {
                                    return val.length > 3
                                        ? null
                                        : "Enter username 3+ char";
                                  },
                                  style: simpleTextStyle(),
                                  controller: usernameEditingController,
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.person),
                                      hintText: "Username",
                                      border: InputBorder.none),
                                ),
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
                                  validator: (val) {
                                    return val.length > 2
                                        ? null
                                        : "Enter correct college name";
                                  },
                                  style: simpleTextStyle(),
                                  controller: collegeEditingController,
                                  //decoration: textFieldInputDecoration("password"),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.school),
                                      hintText: "College",
                                      border: InputBorder.none),
                                ),
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
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    return val.length > 9
                                        ? null
                                        : "Enter Correct Phone number";
                                  },
                                  style: simpleTextStyle(),
                                  controller: phoneEditingController,
                                  //decoration: textFieldInputDecoration("password"),
                                  decoration: InputDecoration(
                                      icon: Icon(Icons.phone),
                                      hintText: "Phone Number",
                                      border: InputBorder.none),
                                ),
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
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    return val.length > 0
                                        ? null
                                        : "Enter valid year";
                                  },
                                  style: simpleTextStyle(),
                                  controller: yearEditingController,
                                  //decoration: textFieldInputDecoration("password"),
                                  decoration: InputDecoration(
                                      hintText: "Year",
                                      border: InputBorder.none),
                                ),
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
                                  validator: (val) {
                                    return val.length > 1
                                        ? null
                                        : "Enter username 3+ char";
                                  },
                                  style: simpleTextStyle(),
                                  controller: branchEditingController,
                                  decoration: InputDecoration(
                                      hintText: "Branch",
                                      border: InputBorder.none),
                                ),
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
                                  style: simpleTextStyle(),
                                  controller: refer,
                                  decoration: InputDecoration(
                                      hintText: "refer code (ACADEMIC@6391)",
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: selected1Image != null
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 28.0, right: 28, top: 10),
                                child: ClipOval(
                                  child: Image.file(selected1Image),
                                ))
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFFFF1E6FF),
                                  radius: 120,
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: <Widget>[
                                        Text("Slect profile pic",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        IconButton(
                                          tooltip: "take image from phone",
                                          color: Colors.white,
                                          icon: Icon(Icons.image),
                                          iconSize: 50,
                                          onPressed: () {
                                            getImage();
                                          },
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              getImagefromcamera();
                                            },
                                            tooltip: "take image from camera",
                                            icon: Icon(Icons.camera_alt),
                                            color: Colors.white,
                                            iconSize: 40),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Dancing",
                              color: Colors.deepPurpleAccent,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          child: Text(
                            "SignIn now",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Dancing",
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 50),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            singUp();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(colors: [
                                  Color(0xFF6F35A5),
                                  Color(0xFF6F35A5)
                                ])),
                            // width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Sign Up",
                              //style: biggerTextStyle(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      // : SafeArea(
    );
  }
}
