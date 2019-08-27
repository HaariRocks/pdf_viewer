import 'package:flutter/material.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';

class Pageone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("loadAsset()"),
        onPressed: () {
          buildLoadAsset;
        },
      ),
    );
  }

  Future<String> get buildLoadAsset async => PdfViewer.loadAsset(
        'assets/test.pdf',
        config: PdfViewerConfig(
          nightMode: true,
        ),
      );
}
