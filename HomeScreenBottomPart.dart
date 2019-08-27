import 'package:bvc/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';
import 'dart:async';

ThemeData apptheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

var viewAllStyle = TextStyle(fontSize: 14.0, color: apptheme.primaryColor);

class HomeScreenBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Preferred Text Books",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                Spacer(flex: 2),
                Expanded(
                  child: InkWell(
                    child: Text(
                      "ViewAll",
                      style: viewAllStyle,
                    ),
                    onTap: () {
                      print("tapped");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustumStateChange()));
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 210.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: booksList,
            ),
          ),
        ],
      ),
    );
  }
}

List<BooksList> booksList = [
  BooksList('assets/images/python.jpg', 'Python', 'assets/test.pdf'),
  BooksList('assets/images/data.jpg', 'DataStructures', 'assets/test.pdf'),
  BooksList('assets/images/R.jpg', 'R-Programming', 'assets/test.pdf'),
  BooksList('assets/images/java.jpg', 'Java', 'assets/test.pdf'),
  BooksList('assets/images/cc.jpg', 'C-programming', 'assets/test.pdf'),
];

class BooksList extends StatelessWidget {
  final String imagePath, bookName, pdfs;

  get printFile async {
    String printfile = await buildLoadAsset();
    return printfile;
  }

  Future<String> buildLoadAsset() {
    return Future.delayed(Duration(milliseconds: 500), () {
      return PdfViewer.loadAsset(
        'assets/test.pdf',
        config: PdfViewerConfig(
          nightMode: false,
        ),
      );
    });
  }

  BooksList(this.imagePath, this.bookName, this.pdfs);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: <Widget>[
            Container(
              height: 210.0,
              width: 160.0,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              child: Row(
                children: <Widget>[
                  Text(
                    bookName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 5.0,
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.white10,
                    child: Text("Open"),
                    onPressed: () {
                      printFile;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
