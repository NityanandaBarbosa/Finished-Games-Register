import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
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
  PublisherModel pubChoice;

  @observable
  String gameName;

  @observable
  String idPub;

  @observable
  GameModel gameToEdit;

  @action
  setGameToEdit(GameModel value) => gameToEdit = value;

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
    setReleaseDate(gameToEdit.releaseDate);
    setIdPub(gameToEdit.idPub);
    setName(gameToEdit.name);
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
        (releaseDate.compareTo(pubChoice.closedDate) < 0 || releaseDate == pubChoice.closedDate)
            ? closedControl = true
            : closedControl = false;
      }catch(e){
        closedControl = true;
      }
    if ((releaseDate.compareTo(pubChoice.foundingDate) > 0 || releaseDate  == pubChoice.foundingDate) &&
        (closedControl == true)) {
      return true;
    }else {
      ShowAlertDialog(context, "Release Date is invalid!");
      return false;
    }
  }

  Future saveRequest(context) async {
    var requestResponse;
    if(verifyFields() == false){
      return false;
    }else{
      if(verifyDates(context) == true) {
        if (gameToEdit == null) {
          requestResponse = await _gameApi.postGame(
              _auth.myId, pubChoice.idPub, gameName, releaseDate.toString());
        } else {
          requestResponse = await _gameApi.putGame(_auth.myId, pubChoice.idPub,
              gameToEdit.idGame, gameName, releaseDate.toString());
        }
        return requestResponse;
      }
    }
  }

  Future delete() async {
    try {
      var response = await _gameApi.deleteGame(_auth.myId, gameToEdit.idGame);
      await listStore.refreshList();
      return response;
    } catch (e) {
      return null;
    }
  }
}
