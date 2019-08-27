import 'package:flutter/material.dart';

class CustumShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .5, size.height - 30.0);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secoundEndPoint = Offset(size.width, size.height - 80.0);
    var secoundControlPoint = Offset(size.width * .75, size.height - 10);

    path.quadraticBezierTo(secoundControlPoint.dx, secoundControlPoint.dy,
        secoundEndPoint.dx, secoundEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
