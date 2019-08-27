import 'package:bvc/HomeScreenTopPart.dart';
import 'package:bvc/Page.dart';
//import 'package:bvc/Pageone.dart';
import 'package:bvc/HomeScreenBottomPart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdf_viewer/flutter_pdf_viewer.dart';

ThemeData apptheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

final appBar = AppBar(
  elevation: 0.0,
  // title: Text(
  //   'CseDemo',
  //   style: TextStyle(
  //     color: Colors.black,
  //     fontSize: 30.0,
  //   ),
  // ),
  //centerTitle: true,
  backgroundColor: Colors.deepOrangeAccent.shade400,
);

void main() {
  runApp(Cse());
  PdfViewer.enableAnalytics(Duration(milliseconds: 500));
}

class Cse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BvcDemo',
      debugShowCheckedModeBanner: false,
      home: CustumAppBar(),
      theme: apptheme,
    );
  }
}

class CustumAppBar extends StatefulWidget {
  final Widget child;

  CustumAppBar({Key key, this.child}) : super(key: key);

  _CustumAppBarState createState() => _CustumAppBarState();
}

class _CustumAppBarState extends State<CustumAppBar> {
  int _currentIndex = 0;
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            HomeScreenTopPart(),
            HomeScreenBottomPart(),
            HomeScreenBottomPart(),
          ],
        );
      case 1:
        return MyPage();
        break;

      case 2:
        return MyPage();
        break;
      default:
        return ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            HomeScreenTopPart(),
            HomeScreenBottomPart(),
            HomeScreenBottomPart(),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        //scrollDirection: Axis.vertical,
        child: callPage(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            title: Text("Data"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_device_information),
            title: Text("About"),
          ),
        ],
      ),
    );
  }
}
