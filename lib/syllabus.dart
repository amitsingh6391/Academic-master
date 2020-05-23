import "package:flutter/material.dart";
import "package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart";

class Viewpdf extends StatefulWidget {
  @override
  _ViewpdfState createState() => _ViewpdfState();
}

class _ViewpdfState extends State<Viewpdf> {

  String url1  = "https://coderzoneschool.files.wordpress.com/2020/04/sallybus-1-year.pdf";

 
 PDFDocument _doc;

 bool _loading;

 void initState(){

   super.initState();
   
   _loadPdf();

 }

 _loadPdf() async{
   
   setState(() {
     _loading=true;
   });
   final doc = await PDFDocument.fromURL(url1);
  setState(() {
    _doc = doc;
    _loading= false;
  });

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("Syllabus"),
        backgroundColor: Colors.black12,
      ),
      body: Center(

        child: PDFViewer(document: _doc,
        indicatorText: Colors.red,
        indicatorBackground: Colors.green,
        
        
        ),
        ),
      
    );
  }
}

//for second year syllabus

class Syllabus2 extends StatefulWidget {
  @override
  _Syllabus2State createState() => _Syllabus2State();
}

class _Syllabus2State extends State<Syllabus2> {

String url2  = "https://coderzoneschool.files.wordpress.com/2020/04/sallybus-2-year.pdf";

 
 PDFDocument _doc2;

 bool _loading;

 void initState(){

   super.initState();
   
   _loadPdf();

 }

 _loadPdf() async{
   
   setState(() {
     _loading=true;
   });
   final doc = await PDFDocument.fromURL(url2);
  setState(() {
    _doc2 = doc;
    _loading= false;
  });

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("Syllabus"),
        backgroundColor: Colors.black12,
      ),
      body: Center(

        child: PDFViewer(document: _doc2,
        indicatorText: Colors.red,
        indicatorBackground: Colors.green,
        
        
        ),
        ),
      
    );
  }
}

//third year sallybus


class Syllabus3 extends StatefulWidget {
  @override
  _Syllabus3State createState() => _Syllabus3State();
}

class _Syllabus3State extends State<Syllabus3> {

String url3  = "https://coderzoneschool.files.wordpress.com/2020/04/sallybus-3-year.pdf";

 
 PDFDocument _doc3;

 bool _loading;

 void initState(){

   super.initState();
   
   _loadPdf();

 }

 _loadPdf() async{
   
   setState(() {
     _loading=true;
   });
   final doc = await PDFDocument.fromURL(url3);
  setState(() {
    _doc3 = doc;
    _loading= false;
  });

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("Syllabus"),
        backgroundColor: Colors.black12,
      ),
      body: Center(

        child: PDFViewer(document: _doc3,
        indicatorText: Colors.red,
        indicatorBackground: Colors.green,
        
        
        ),
        ),
      
    );
  }
}

//syllbus for fourth year

class Syllabus4 extends StatefulWidget {
  @override
  _Syllabus4State createState() => _Syllabus4State();
}

class _Syllabus4State extends State<Syllabus4> {

String url4  = "https://coderzoneschool.files.wordpress.com/2020/04/sallybus-4-year.pdf";

 
 PDFDocument _doc4;

 bool _loading;

 void initState(){

   super.initState();
   
   _loadPdf();

 }

 _loadPdf() async{
   
   setState(() {
     _loading=true;
   });
   final doc = await PDFDocument.fromURL(url4);
  setState(() {
    _doc4 = doc;
    _loading= false;
  });

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("Syllabus"),
        backgroundColor: Colors.black12
      ),
      body: Center(

        child: PDFViewer(document: _doc4,
        indicatorText: Colors.red,
        indicatorBackground: Colors.green,
        
        
        ),
        ),
      
    );
  }
}