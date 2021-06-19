import 'package:flutter_modular/flutter_modular.dart';
import 'package:finished_games_register/app/modules/list/game/game_store.dart';
import 'package:flutter/material.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart'
as gradientComp;

class GamePage extends StatefulWidget {
  final String title;
  const GamePage({key, this.title = 'GamePage'}) : super(key: key);
  @override
  GamePageState createState() => GamePageState();
}
class GamePageState extends ModularState<GamePage, GameStore> {
  final GameStore store = Modular.get();

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
      appBar: gradientComp.appBarGradient(context, "Game Page"),
      body: gradientComp.backgroundGradient(context, publisherPage(context)),
    );
  }
}
