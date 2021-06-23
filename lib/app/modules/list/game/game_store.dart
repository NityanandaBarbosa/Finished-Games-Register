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
  final ListStore listStore = Modular.get<ListStore>();

  @observable
  DateTime releaseDate;

  @observable
  var pub;

  @observable
  var pubChoice;

  @observable
  String gameName;

  @observable
  List<String> listPubs = [];

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


  /*void setGameValues(){
    DateTime dtRelease = DateTime.parse(game.releaseDate);
    releaseDate = dtRelease;
    idPub = game.idPub;
    gameName = game.name;
  }*/

  Future<void> getPubsName() async {
    print("AQUI ${listStore.responsePubs}");
    for(var i in listStore.responsePubs){
      listPubs.add(i.name);
    }
    print("LIST OF PUBS");
    print(listPubs);
  }

  Future saveGame(context) async {
    var returnResponse = await verifyFields(context);
    if (returnResponse == false) {
      ShowAlertDialog(context, 'Fill the required fields!');
      return false;
    } else if (returnResponse == null) {
      ShowAlertDialog(context, 'Could not connect to server!');
      return null;
    } else if(returnResponse != "none") {
      return true;
    }
  }

  Future verifyFields(context) async {
    if (gameName == null || gameName == "" || releaseDate == null /*|| pub == null*/) {
      return false;
    } else {
      //if(closedDate.compareTo(foundingDate)>0){
      if(pub == null){
        response = await _gameApi.postGame(_auth.myId, pub.idPub,gameName, releaseDate.toString());
      }else{
        response = await _gameApi.putGame(_auth.myId, pub.idPub,gameName, releaseDate.toString());
      }
      /*}else{
        ShowAlertDialog(context, "Closed Date are bigger then Founding Date!");
        return "none";
      }*/
      return response;
    }
  }

  Future delete() async{
    try{
      var response = await _gameApi.deleteGame(_auth.myId, game.idGame);
      return response;
    }catch(e){
      return null;
    }

  }
}
