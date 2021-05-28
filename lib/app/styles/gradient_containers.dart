import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientStyle {
  final colorInit = 0xFFde6262;
  final colorEnd = 0xFFffb88c;

  Widget backgroundGradient(context, code) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(colorInit), Color(colorEnd)]),
        ),
        child: buildScreen(context, code));
  }

  Widget appBarGradient(context, barTitle) {
    return AppBar(
      backgroundColor: Color(0xFFF8F8F8),
      iconTheme: new IconThemeData(color: Color(0xFF686868)),
      title: Text(barTitle),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(colorInit), Color(colorEnd)]),
        ),
      ),
    );
  }

  Widget buildScreen(context, code) {
    return code;
  }
}
