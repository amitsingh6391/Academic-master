

import "package:flutter/material.dart";

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Aktuerp extends StatefulWidget {
  @override
  _AktuerpState createState() => _AktuerpState();
}

class _AktuerpState extends State<Aktuerp> {
  @override

  
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(_)=>WebviewScaffold(
          url:"https://aktu.ac.in/",
         
        appBar: AppBar(title:Center(
          child: Text("Aktu erp",style:TextStyle(fontSize:40)
          ),
        ),
        backgroundColor: Color(0xFF0000A0),
        ),
        withZoom: true,
        )
      },
    );
  }
}

//previous year question paper...

class Privacy extends StatefulWidget {
  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      routes: {
        "/":(_)=>WebviewScaffold(
          url:"https://academic-master.flycricket.io/privacy.html",
         
        appBar: AppBar(title:Center(
          child: Text("Privacy policy",style:TextStyle(fontSize:40),
          ),
        ),
        backgroundColor:Color(0xFF0000A0),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel,size: 40,))
        ],
        ),
        withZoom: true,
        )
      },
      
    );
  }
}