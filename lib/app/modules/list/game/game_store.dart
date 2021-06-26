import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/games/games_api_interface.dart';
import 'package:finished_games_register/app/styles/system_pop_ups.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../list_store.dart';
import 'entities/game_model.dart';

part 'game_store.g.dart';

class GameStore = _GameStoreBase with _$GameStore;

abstract class _GameStoreBase with Store {
  final AuthStore _auth = Modular.get();
  final IGameApi _gameApi = Modular.get();

  @observable
  DateTime releaseDate;

  @observable
  var pubChoice;

  @observable
  String gameName;

  @observable
  String idPub;

  @observable
  var response;

  @observable
  GameModel game;

  @action
  setGame(GameModel value) => game = value;

  @action
  setName(String value) => gameName = value;

  @action
  setReleaseDate(DateTime value) => releaseDate = value;

  @action
  setPubChoice(var value) => pubChoice = value;

  void setGameValues() {
    DateTime dtRelease = DateTime.parse(game.releaseDate);
    releaseDate = dtRelease;
    idPub = game.idPub;
    gameName = game.name;
  }

  Future saveGame(context) async {
    var returnResponse = await verifyFields(context);
    if (returnResponse == false) {
      ShowAlertDialog(context, 'Fill the required fields!');
      return false;
    } else if (returnResponse == null) {
      ShowAlertDialog(context, 'Could not connect to server!');
      return null;
    } else if (returnResponse != "none") {
      return true;
    }
  }

  Future verifyFields(context) async {
    bool closedControl = true;

    if (gameName == null ||
        gameName == "" ||
        releaseDate == null ||
        pubChoice == null) {
      return false;
    } else {
      try{
        releaseDate.compareTo(DateTime.parse(pubChoice.closedDate)) < 0
            ? closedControl = true
            : closedControl = false;
      }catch(e){
        closedControl = true;
      }
      if ((releaseDate.compareTo(DateTime.parse(pubChoice.foundingDate)) > 0) &&
          (closedControl == true)) {
        if (game == null) {
          response = await _gameApi.postGame(
              _auth.myId, pubChoice.idPub, gameName, releaseDate.toString());
        } else {
          response = await _gameApi.putGame(_auth.myId, pubChoice.idPub,
              game.idGame, gameName, releaseDate.toString());
        }
      } else {
        ShowAlertDialog(context, "Release Date is invalid!");
        return "none";
      }
      return response;
    }
  }

  Future delete() async {
    try {
      var response = await _gameApi.deleteGame(_auth.myId, game.idGame);
      return response;
    } catch (e) {
      return null;
    }
  }
}
