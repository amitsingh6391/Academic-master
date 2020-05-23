

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
          url:"https://erp.aktu.ac.in/",
        appBar: AppBar(title:Center(
          child: Text("Aktu erp",style:TextStyle(fontSize:40)
          ),
        ),
        backgroundColor: Colors.black12,
        ),
        withZoom: true,
        )
      },
    );
  }
}
