import 'package:Academicmaster/view/chat.dart';
import 'package:Academicmaster/view/module/user.dart';
import "package:firebase_auth/firebase_auth.dart";


import  'package:google_sign_in/google_sign_in.dart'; 

// class AuthMethods{

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   User _userFromFirebaseUser(FirebaseUser user){

//     return user !=null ? User(uid:user.uid) :null;
//   }
  
//   Future signInWithEmailAndPasssword(String email, String password) async{
    
//     try
//     {

//       AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      
//       FirebaseUser firebaseUser  = result.user;

//       return _userFromFirebaseUser(firebaseUser);


//     }catch(e){

//       print(e.toString());
//       return null;

//     }
//   } 
  

//   Future signUpwithEmailAndPassword(String email, String password) async{

//     try{
//       AuthResult result = await _auth.createUserWithEmailAndPassword
//       (email: email, password: password);
//       FirebaseUser firebaseUser = result.user;
//       return _userFromFirebaseUser(firebaseUser);

//     }catch(e){
//       print(e.toString());
//       return null;
//     }

//   }

//   Future resettPath(String email) async{
//     try{

//       return await _auth.sendPasswordResetEmail(email: email);


//     }catch(e){
//       print(e);
//     }
//   }
//   Future signOut() async{
//     try{
//       return 
//       await _auth.signOut();
//     }
//     catch(e){

//       print(e.toString());
//     }
//   }

  

// }


import 'package:flutter/material.dart';

// Widget appBarMain(BuildContext context) {
//   return AppBar(
//     title: Image.asset(
//       "assets/images/logo.png",
//       height: 40,
//     ),
//     elevation: 0.0,
//     centerTitle: false,
//   );
// }

// InputDecoration textFieldInputDecoration(String hintText) {
//   return InputDecoration(
//       hintText: hintText,
//       hintStyle: TextStyle(color: Colors.white54),
//       focusedBorder:
//           UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//       enabledBorder:
//           UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
// }

// TextStyle simpleTextStyle() {
//   return TextStyle(color: Colors.white, fontSize: 16);
// }

// TextStyle biggerTextStyle() {
//   return TextStyle(color: Colors.white, fontSize: 17);
// }

// import 'package:chatapp/views/signin.dart';
// import 'package:chatapp/views/signup.dart';
// import 'package:flutter/material.dart';


// class Authenticate extends StatefulWidget {
//   @override
//   _AuthenticateState createState() => _AuthenticateState();
// }

// class _AuthenticateState extends State<Authenticate> {
//   bool showSignIn = true;

//   void toggleView() {
//     setState(() {
//       showSignIn = !showSignIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showSignIn) {
//       return SignIn(toggleView);
//     } else {
//       return SignUp(toggleView);
//     }
//   }
// }

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = new GoogleSignIn();

    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = await _auth.signInWithCredential(credential);
    FirebaseUser userDetails = result.user;

    if (result == null) {
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}