import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ShowAlertDialog(context, message) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("${message}"),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
