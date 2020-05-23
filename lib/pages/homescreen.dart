import 'package:Academicmaster/os.dart';

import "package:flutter/material.dart";

import '../aktuerp.dart';
import "homepage.dart";

import "package:Academicmaster/pages/posts.dart";


import "package:Academicmaster/view/viewmain.dart";

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentpage = 0;

  var pages = [
   
  
    MyApp(),

    Homepage(),

    
    HomPage(),

    Aktuerp(),

   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentpage,
          onTap: (i) {
            setState(() {
              currentpage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
             
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              title: Text("Chat"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              title: Text("blogs"),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              title: Text("Aktu erp"),
            ),
            
            
          ]),
      body: pages[currentpage],
    );
  }
}
