import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

Widget appBarGradient(context, barTitle, [logout = false]) {
  return AppBar(
    backgroundColor: Color(0xFFF8F8F8),
    leading: logout == true ? IconButton(
      icon: Icon(Icons.exit_to_app),
        onPressed: () => Navigator.of(context).pop(),
    ) : IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    ),
    iconTheme: new IconThemeData(color: Color(0xFF686868)),
    title: Text(barTitle, overflow: TextOverflow.ellipsis,),
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

Widget appBarDelete(context, barTitle,[deletefunc = null]) {
  return AppBar(
    backgroundColor: Color(0xFFF8F8F8),
    iconTheme: new IconThemeData(color: Color(0xFF686868)),
    title: Container(
      child: Text(barTitle,overflow: TextOverflow.ellipsis,),
    ),
    //centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.delete_forever_outlined),
        onPressed:() async{
          await deletefunc();
          Modular.to.pop();
        },
      ),
    ],
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

Widget containerGradient(context, code){
  return Container(
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Color(colorEnd), Color(colorInit)]),
      ),
      child: code,
  );
}

Widget buildScreen(context, code) {
  return code;
}


