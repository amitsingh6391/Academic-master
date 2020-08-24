import 'package:Academicmaster/branch.dart';
import 'package:Academicmaster/pages/course.dart';

import 'package:Academicmaster/pages/profilescreen.dart';
import 'package:Academicmaster/view/chatrooms.dart';

import "package:flutter/material.dart";


import "package:Academicmaster/view/viewmain.dart";

import "package:curved_navigation_bar/curved_navigation_bar.dart";


<<<<<<< HEAD
=======
import "package:Academicmaster/view/viewmain.dart";
import"package:curved_navigation_bar/curved_navigation_bar.dart";
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  var pages = [
<<<<<<< HEAD
    MyApp(), 
    //ChewieDemo(),
    //Branch(),
    Course(),
     ChatRoom(),
      Profilescreen()];
=======
   MyApp(),

   HomPage(),

    Branch(),
    FreecoursePage(),
    Aktuerp(),
  ];
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.red,
                ),
                Text("Home",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Icon(Icons.book, size: 35, color: Colors.red),
                Text(
                  "Study material",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
<<<<<<< HEAD
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Icon(Icons.chat, size: 35, color: Colors.red),
                Text(
                  "Chat",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
=======
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,

              ),
              title: Text("Home"),
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Icon(Icons.perm_identity, size: 35, color: Colors.red),
                Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: pages[_page]);
  }
}
