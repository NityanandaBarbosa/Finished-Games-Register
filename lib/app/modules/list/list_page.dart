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

class ListPageState extends ModularState<ListPage, ListStore> {
  final ListStore store = Modular.get<ListStore>();

  @override
  Widget build(BuildContext context) {
    store.getCredential();
    Widget listComponents(context) {
      return Container(
        alignment: Alignment.center,
        child: store.userId == null
            ? CircularProgressIndicator()
            : Text('${store.userId}',
                style: TextStyle(
                    fontSize: 25,
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
