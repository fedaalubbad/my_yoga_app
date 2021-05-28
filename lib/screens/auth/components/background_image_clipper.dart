import 'package:flutter/material.dart';
import 'package:my_yoga_app/constants/constants.dart';
import 'package:my_yoga_app/global/widgets/curve_clipper.dart';



class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        height: size.height * 0.55,
        color: blueGrey.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 0.0,
              vertical: 0.0),
            child: Image(
              image: AssetImage('assets/images/pic2.jpg'),
              fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}