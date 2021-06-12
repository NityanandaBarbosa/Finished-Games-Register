import 'package:flutter_modular/flutter_modular.dart';
import 'package:finished_games_register/app/modules/list/publisher/publisher_store.dart';
import 'package:flutter/material.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart'
    as gradientComp;

class PublisherPage extends StatefulWidget {
  final String title;
  const PublisherPage({key, this.title = 'PublisherPage'}) : super(key: key);
  @override
  PublisherPageState createState() => PublisherPageState();
}

class PublisherPageState extends ModularState<PublisherPage, PublisherStore> {
  final PublisherStore store = Modular.get<PublisherStore>();

  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    Widget publisherPage(context) {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [],
        ),
      );
    }

    return Scaffold(
      appBar: gradientComp.appBarGradient(context, "Publisher Page"),
      body: gradientComp.backgroundGradient(context, publisherPage(context)),
    );
  }
}
