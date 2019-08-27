import 'package:flutter/material.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';

class CustumStateChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FavoriteBook"),
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Search(),
              );
            },
          ),
          // GestureDetector(
          //   onTap: () {},
          //   child: Icon(Icons.search),
          // )
        ],
      ),
      body: Rock(),
    );
  }
}

class Rock extends StatelessWidget {
  final Widget child;

  Rock({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: booksList,
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: 500.0,
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
          ],
        ),
      ),
    );
  }
}

class Search extends SearchDelegate<BooksList> {
  //final String imagePath, bookName, pdfs;
  final books = BooksList;

  final List<BooksList> booksList = [
    BooksList('assets/images/python.jpg', 'Python', 'assets/test.pdf'),
    BooksList('assets/images/data.jpg', 'DataStructures', 'assets/test.pdf'),
    BooksList('assets/images/R.jpg', 'R-Programming', 'assets/test.pdf'),
    BooksList('assets/images/java.jpg', 'Java', 'assets/test.pdf'),
    BooksList('assets/images/cc.jpg', 'C-programming', 'assets/test.pdf'),
  ];

  final List<BooksList> recentbook = [
    BooksList('assets/images/R.jpg', 'R-Programming', 'assets/test.pdf'),
    BooksList('assets/images/java.jpg', 'Java', 'assets/test.pdf'),
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Column(
        children: <Widget>[],
      );
    } else if (query.startsWith("p")) {
      return Column(
        children: <Widget>[
          BooksList('assets/images/python.jpg', 'Python', 'assets/test.pdf'),
        ],
      );
    } else if (query.startsWith("j")) {
      return Column(
        children: <Widget>[
          BooksList('assets/images/java.jpg', 'Java', 'assets/test.pdf'),
        ],
      );
    } else if (query.startsWith("r")) {
      return Column(
        children: <Widget>[
          BooksList('assets/images/R.jpg', 'R-Programming', 'assets/test.pdf'),
        ],
      );
    } else if (query.startsWith("d")) {
      return Column(
        children: <Widget>[
          BooksList(
              'assets/images/data.jpg', 'DataStructures', 'assets/test.pdf'),
        ],
      );
    } else if (query.startsWith("c")) {
      return Column(
        children: <Widget>[
          BooksList('assets/images/cc.jpg', 'C-programming', 'assets/test.pdf'),
        ],
      );
    } else {
      return Container();
    }
  }
}
