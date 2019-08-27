import 'package:flutter/material.dart';
import 'package:bvc/CustumShapeClipper.dart';
import 'package:bvc/SearchBar.dart';

Color firstColor = Color(0xFFF47015);
Color secoundColor = Color(0xFFFF1111);

ThemeData apptheme =
    ThemeData(primaryColor: Color(0xFFF3791A), fontFamily: 'Oxygen');

List<String> locations = ["CSE", "MECH", "ECE", "EEE", "CIVIL"];

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustumShapeClipper(),
            child: Container(
              height: 400.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secoundColor]),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        PopupMenuButton(
                            onSelected: (index) {
                              setState(() {
                                selectedLocationIndex = index;
                              });
                            },
                            child: Row(
                              children: <Widget>[
                                Text(
                                  locations[selectedLocationIndex],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<int>>[
                                  PopupMenuItem(
                                    child: Text(
                                      locations[0],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.0),
                                    ),
                                    value: 0,
                                  ),
                                  PopupMenuItem(
                                    child: Text(
                                      locations[1],
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.0),
                                    ),
                                    value: 1,
                                  )
                                ]),
                        Spacer(),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Welcome to \n BVC Engineering College",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: TextField(
                        controller: TextEditingController(text: "search.."),
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                        cursorColor: apptheme.primaryColor,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 14.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustumStateChange()));
                                },
                                child: Icon(Icons.search, color: Colors.black)),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottom: true,
    );
  }
}
