<<<<<<< HEAD
import "package:flutter/material.dart";
import "package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart";


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
=======
import "package:flutter/material.dart";
import "package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart";


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
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
}