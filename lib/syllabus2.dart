<<<<<<< HEAD
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
=======
import "package:flutter/material.dart";
import "package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart";

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
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
}