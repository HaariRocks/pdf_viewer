import 'package:bvc/src/data.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Students> _student = student;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {
          // _student.removeRange(1, 3);
        });
        return;
      },
      child: ListView(
        children: _student.map(_builditems).toList(),
      ),
    );
  }
}

Widget _builditems(Students e) {
  return Padding(
    key: Key(e.name),
    padding: const EdgeInsets.all(8.0),
    child: ExpansionTile(
      title: Text(
        e.name.toUpperCase(),
        style: TextStyle(fontSize: 25),
      ),
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "${e.subject_1}".toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    ),
  );
}
