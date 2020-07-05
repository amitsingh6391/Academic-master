import 'dart:io';

//import 'package:Academicmaster/pages/posts.dart';
import 'package:Academicmaster/view/helper/theme.dart';
import 'package:Academicmaster/view/viewservices/auth.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:Academicmaster/view/widgets/widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import "package:Academicmaster/view/chatrooms.dart";

import "package:Academicmaster/view/helper/helperfunction.dart";
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:image_cropper/image_cropper.dart';



class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp(this.toggleView);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController =new TextEditingController();
  TextEditingController collegeEditingController = new TextEditingController();
  TextEditingController phoneEditingController = new TextEditingController();
   TextEditingController branchEditingController = new TextEditingController();
  TextEditingController yearEditingController = new TextEditingController();

  AuthService authService = new AuthService();

  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  //File selectedImage;
 
  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

   
  //   cropImage(image);
  // }

  // cropImage(File image) async {
  //   File croppedImage = await ImageCropper.cropImage(
  //       sourcePath: image.path, compressQuality: 40);

  //   setState(() {
  //     selectedImage = croppedImage;
  //   });
  // }

  

  singUp() async {

    if(formKey.currentState.validate()){
      setState(() {

        isLoading = true;
      });

      // StorageReference firebaseStorageRef = FirebaseStorage.instance
      //     .ref()
      //     .child("Profile")
      //     .child("${randomAlphaNumeric(9)}.jpg");

     // final StorageUploadTask task = firebaseStorageRef.putFile(selectedImage);

      // var downloadUrl = await (await task.onComplete).ref.getDownloadURL();
      // print("this is url $downloadUrl");

      await authService.signUpWithEmailAndPassword(emailEditingController.text,
          passwordEditingController.text).then((result){
            if(result != null){

              Map<String,String> userDataMap = {
                
                "userName" : usernameEditingController.text,
                "userEmail" : emailEditingController.text,
                "userphonenumber": phoneEditingController.text,
                "usercollege": collegeEditingController.text,
                "userbranch": branchEditingController.text,
                "useryear": yearEditingController.text,
              };

              databaseMethods.addUserInfo(userDataMap);

              HelperFunctions.saveUserLoggedInSharedPreference(true);
              HelperFunctions.saveUserNameSharedPreference(usernameEditingController.text);
              HelperFunctions.saveUserEmailSharedPreference(emailEditingController.text);
              HelperFunctions.saveUserYearSharedPreference(emailEditingController.text);
              HelperFunctions.saveUserYearSharedPreference(emailEditingController.text);
              HelperFunctions.saveBranchSharedPreference(emailEditingController.text);
               HelperFunctions.saveUserPhoneSharedPreference(emailEditingController.text);
              

              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => ChatRoom()
              ));
            }
      });
    }
  }
 
 
 

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
     // resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("Academic master",style: TextStyle(fontWeight: FontWeight.bold),),
      backgroundColor: Colors.cyan,
      ),
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
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:AssetImage("images/ic_launcher.png")
                    ),
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
                colors: [const Color(0xff007EF4), const Color(0xff2A75BC)],
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
                  color: Colors.white,
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
    );
    
  }

  

 

  
  }