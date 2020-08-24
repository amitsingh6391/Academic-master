//neeraj code

import 'package:Academicmaster/pages/posts.dart';
import 'package:Academicmaster/view/viewservices/auth.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:Academicmaster/view/widgets/widget.dart';

import "package:flutter/material.dart";
import "package:Academicmaster/view/chatrooms.dart";

import "package:Academicmaster/view/helper/helperfunction.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

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

  AuthService authService = new AuthService();

  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  String userid;

  singUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signUpWithEmailAndPassword(
              emailEditingController.text, passwordEditingController.text)
          .then((result) {
        if (result != null) {
          // Map<String, String> userDataMap = {
          //   "userEmail": emailEditingController.text,
          // };

          // databaseMethods.addUserInfo(userDataMap);

          // HelperFunctions.saveUserLoggedInSharedPreference(true);

          // HelperFunctions.saveUserEmailSharedPreference(
          //     emailEditingController.text);

          Map<String, String> userDataMap = {
            "userName": usernameEditingController.text,
            "userEmail": emailEditingController.text,
            "userphonenumber": phoneEditingController.text,
            "usercollege": collegeEditingController.text,
            "userbranch": branchEditingController.text,
            "useryear": yearEditingController.text,
          };

          databaseMethods.addUserInfo(userDataMap);

          HelperFunctions.saveUserLoggedInSharedPreference(true);
          HelperFunctions.saveUserNameSharedPreference(
              usernameEditingController.text);
          HelperFunctions.saveUserEmailSharedPreference(
              emailEditingController.text);
          HelperFunctions.saveUserYearSharedPreference(
              emailEditingController.text);
          HelperFunctions.saveUserYearSharedPreference(
              emailEditingController.text);
          HelperFunctions.saveBranchSharedPreference(
              emailEditingController.text);
          HelperFunctions.saveUserPhoneSharedPreference(
              emailEditingController.text);

          getCurrentUser();
        }
      });
    }

    // uploaduserprofile();
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
      "userName": usernameEditingController.text,
      "userEmail": emailEditingController.text,
      "userphonenumber": phoneEditingController.text,
      "usercollege": collegeEditingController.text,
      "userbranch": branchEditingController.text,
      "useryear": yearEditingController.text,
      "follower":0,
      "following":0,
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
      backgroundColor: Colors.white,
<<<<<<< HEAD
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
                      child: SafeArea(
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
                                Text(
                                  "Academic Master",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Dancing",
                                    color: Color(0xFF6F35A5),
                                  ),
                                ),
                                
                                
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
                                    controller:branchEditingController,
                                    decoration: InputDecoration(
                                        
                                        hintText: "Branch",
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                            ),
                          ),
                        ),
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
                                widget.toggleView();
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
                        Container(
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
                        
                      ],
                    ),
                  ),
                ),
             ),
          ),
      // : SafeArea(
=======
     // resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) :  Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
                  child: Column(
              children: [
                //Spacer(),
               
                 Container(
                   //color: Colors.white,
                   //height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape:BoxShape.circle
                    ),
                    child:Image.asset("images/download (5).jpg")

                 ),
                
                Form(
                  key: formKey,
                  child: Column(
          children: [
            TextFormField(
              style: simpleTextStyle(),
              controller: usernameEditingController,
              validator: (val){
                return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
              },
              decoration: textFieldInputDecoration("username"),
            ),
             TextFormField(
              style: simpleTextStyle(),
              controller: collegeEditingController,
              validator: (val){
                return val.isEmpty || val.length < 3 ? "Enter valid college name" : null;
              },
              decoration: textFieldInputDecoration("Enter your college name"),
            ),
            TextFormField(
              style: simpleTextStyle(),
              controller: yearEditingController,
              validator: (val){
                return val.isEmpty || val.length < 0 ? "enter a valid year" : null;
              },
              decoration: textFieldInputDecoration("Enter your year"),
            ),
            TextFormField(
              style: simpleTextStyle(),
              controller: branchEditingController,
              validator: (val){
            return val.isEmpty || val.length < 1 ? "Enter a valid branch name " : null;
              },
              decoration: textFieldInputDecoration("Branch"),
            ),
             TextFormField(
              style: simpleTextStyle(),
              controller: phoneEditingController,
              validator: (val){
                return val.isEmpty || val.length < 10 ? "enter valid phone number" : null;
              },
              decoration: textFieldInputDecoration("Phone number"),
            ),
            TextFormField(
              controller: emailEditingController,
              style: simpleTextStyle(),
              validator: (val){
                return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                    null : "Enter correct email";
              },
              decoration: textFieldInputDecoration("email"),
            ),
            TextFormField(
              obscureText: true,
              style: simpleTextStyle(),
              decoration: textFieldInputDecoration("password"),
              controller: passwordEditingController,
              validator:  (val){
                return val.length < 6 ? "Enter Password 6+ characters" : null;
              },

            ),
          ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: (){
          singUp();
                  },
                  child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [
                Colors.brown[200],
                Colors.yellow[300],
                  ],
              )),
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Sign Up",
            style: biggerTextStyle(),
            textAlign: TextAlign.center,
          ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          Text(
            "Already have an account? ",
            style: simpleTextStyle(),
          ),
          GestureDetector(
            onTap: () {
              widget.toggleView();
            },
            child: Text(
              "SignIn now",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            ),
          ),
                  ],
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
        ),
      ),
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
    );
  }
}
