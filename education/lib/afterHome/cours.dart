import "package:flutter/material.dart";
import "package:advance_pdf_viewer/advance_pdf_viewer.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VoirCour extends StatefulWidget {
  final String? cours;
  final Color? color;
  VoirCour({this.cours, this.color});

  @override
  _VoirCourState createState() => _VoirCourState();
}

class _VoirCourState extends State<VoirCour> {
  PDFDocument document = PDFDocument();

  bool load = true;

  loadDocument(String path) async {
    print(widget.cours);

    switch (path) {
      case "":
        print("pas encore implemente");
        break;
      default:
        try {
          document = await PDFDocument.fromAsset(path);
          setState(() {
            load = false;
          });
        } catch (e) {
          print(e);
        }
    }
  }

  @override
  void initState() {
    super.initState();
    loadDocument(widget.cours!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        child: load
            ? Center(
                child: SpinKitFadingCircle(
                  color: Color(0xFF6C63FF),
                  size: 30,
                ),
              )
            : PDFViewer(
                pickerButtonColor: widget.color,
                tooltip: PDFViewerTooltip(
                  pick: "choisissez une page",
                  jump: "option",
                ),
                progressIndicator: SpinKitFadingCircle(
                  color: Color(0xFF6C63FF),
                  size: 30,
                ),
                document: document,
              ),
      ),
    );
  }
}
