import 'package:Academicmaster/pages/course.dart';
import 'package:Academicmaster/pages/posts.dart';

import 'package:Academicmaster/pages/profilescreen.dart';

import 'package:Academicmaster/view/groupchat/groupchatroom.dart';

import "package:flutter/material.dart";

import "package:curved_navigation_bar/curved_navigation_bar.dart";
import 'package:shared_preferences/shared_preferences.dart';

int back;
int words;

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  var pages = [
    HomPage(),
    Course(),
    Groupchatroom(),
    Profilescreen(),
  ];

  @override
  void initState() {
    getmode();
    super.initState();
  }

  getmode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      back = preferences.getInt('back');
      words = preferences.getInt('words');
    });
    print("hii");
    print(back);
    print(words);
  }

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
                  color: Color(0xFF6F35A5),
                ),
                Text("Home",
                    style: TextStyle(
                        color: Color(0xFF6F35A5), fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Icon(
                  Icons.book,
                  size: 35,
                  color: Color(0xFF6F35A5),
                ),
                Text(
                  "Study material",
                  style: TextStyle(
                    color: Color(0xFF6F35A5),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Icon(
                  Icons.chat,
                  size: 35,
                  color: Color(0xFF6F35A5),
                ),
                Text(
                  "Chat",
                  style: TextStyle(
                      color: Color(0xFF6F35A5), fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                Icon(
                  Icons.perm_identity,
                  size: 35,
                  color: Color(0xFF6F35A5),
                ),
                Text(
                  "Account",
                  style: TextStyle(
                      color: Color(0xFF6F35A5), fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
          color: Color(back),
          buttonBackgroundColor: Colors.white,
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
