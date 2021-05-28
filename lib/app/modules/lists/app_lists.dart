import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_of_finished_games/app/styles/gradient_containers.dart';

class Lists extends StatefulWidget {
  Lists({Key key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  @override
  Widget build(BuildContext context) {
    final gradientStyles = GradientStyle();

    Widget listComponents(context) {
      return Container(
        alignment: Alignment.center,
        child: Text("AQUI !",
            style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.normal)),
      );
    }

    return Scaffold(
      appBar: gradientStyles.appBarGradient(context, "Finished Games"),
      body: gradientStyles.backgroundGradient(context, listComponents(context)),
    );
    /*return Container(
      child: child,
    );*/
  }
}
