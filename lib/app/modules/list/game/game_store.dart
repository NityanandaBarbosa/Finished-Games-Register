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
  final ListStore listStore = Modular.get();

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
  setIdPub(String value) => idPub = value;

  @action
  setReleaseDate(DateTime value) => releaseDate = value;

  @action
  setPubChoice(var value) => pubChoice = value;

  @action
  setGameValues() {
    setReleaseDate(game.releaseDate);
    setIdPub(game.idPub);
    setName(game.name);
  }

  Future saveGame(context) async {
    var returnResponse = await saveRequest(context);
    if (returnResponse == false) {
      ShowAlertDialog(context, 'Fill the required fields!');
      return false;
    } else if (returnResponse == 'no connection') {
      ShowAlertDialog(context, 'Could not connect to server!');
      return null;
    } else if (returnResponse.statusCode == 200) {
      await listStore.refreshList();
      return true;
    }
  }

  bool verifyFields(){
    if (gameName == null ||
        gameName == "" ||
        releaseDate == null ||
        pubChoice == null) {
      return false;
    } else {
      return true;
    }
  }

  bool verifyDates(context){
    bool closedControl = true;
      try{
        releaseDate.compareTo(pubChoice.closedDate) < 0
            ? closedControl = true
            : closedControl = false;
      }catch(e){
        closedControl = true;
      }
    if ((releaseDate.compareTo(pubChoice.foundingDate) > 0) &&
        (closedControl == true)) {
      return true;
    }else {
      ShowAlertDialog(context, "Release Date is invalid!");
      return false;
    }
  }

  Future saveRequest(context) async {
    if(verifyFields() == false){
      return false;
    }else{
      if(verifyDates(context) == true) {
        if (game == null) {
          response = await _gameApi.postGame(
              _auth.myId, pubChoice.idPub, gameName, releaseDate.toString());
        } else {
          response = await _gameApi.putGame(_auth.myId, pubChoice.idPub,
              game.idGame, gameName, releaseDate.toString());
        }
        return response;
      }
    }
  }

  Future delete() async {
    try {
      var response = await _gameApi.deleteGame(_auth.myId, game.idGame);
      await listStore.refreshList();
      return response;
    } catch (e) {
      return null;
    }
  }
}
