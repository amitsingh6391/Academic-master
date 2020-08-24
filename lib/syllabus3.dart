import "package:flutter/material.dart";
import "package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart";
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