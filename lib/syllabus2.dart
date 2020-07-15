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
}