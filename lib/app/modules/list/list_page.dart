import 'package:flutter_modular/flutter_modular.dart';
import 'package:finished_games_register/app/modules/list/list_store.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart'
    as gradientComp;
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final String title;
  const ListPage({key, this.title = 'ListPage'}) : super(key: key);
  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  final ListStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
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
      appBar: gradientComp.appBarGradient(context, "Finished Games"),
      body: gradientComp.backgroundGradient(context, listComponents(context)),
    );
  }
}
