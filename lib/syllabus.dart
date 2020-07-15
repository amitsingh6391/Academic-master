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



//third year sallybus



//syllbus for fourth year

