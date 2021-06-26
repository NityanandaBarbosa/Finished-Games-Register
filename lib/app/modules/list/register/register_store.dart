import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/registers/registers_api.dart';
import 'package:finished_games_register/app/modules/shared/services/registers/registers_api_interface.dart';
import 'package:finished_games_register/app/styles/system_pop_ups.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'entities/register_model.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final AuthStore _auth = Modular.get();
  final IRegisterApi _registerApi = Modular.get();

  @observable
  DateTime initDate;

  @observable
  DateTime endDate;

  @observable
  var gameChoice;

  @observable
  String registerName;

  @observable
  String idPub;

  @observable
  var response;

  @observable
  RegisterModel register;

  @action
  setGame(RegisterModel value) => register = value;

  @action
  setName(String value) => registerName = value;

  @action
  setInitDate(DateTime value) => initDate = value;

  @action
  setEndDate(DateTime value) => endDate = value;

  @action
  setGameChoice(var value) => gameChoice = value;

  /*void setGameValues() {
    DateTime dtRelease = DateTime.parse(game.releaseDate);
    releaseDate = dtRelease;
    idPub = game.idPub;
    gameName = game.name;
  }*/

  Future saveRegister(context) async {
    var returnResponse = await verifyFields(context);
    if (returnResponse == false) {
      ShowAlertDialog(context, 'Fill the required fields!');
      return false;
    } else if (returnResponse == "no connection") {
      ShowAlertDialog(context, 'Could not connect to server!');
      return null;
    } else if(returnResponse.statusCode == 200){
      return true;
    }
  }
  bool checkDates(context){
    if(endDate == null){
      if(initDate.compareTo(DateTime.parse(gameChoice.releaseDate)) < 0) {
        ShowAlertDialog(context, "Init date is bigger then game release date!");
        return false;
      }
    }else{
      if(initDate.compareTo(endDate) > 0){
        ShowAlertDialog(context, "End date is bigger then init date!");
        return false;
      }else{
        if(initDate.compareTo(DateTime.parse(gameChoice.releaseDate)) < 0) {
          print("Init VAZIO");
          ShowAlertDialog(context, "Init date is bigger then game release date!");
          return false;
        }
      }
    }
    return true;
  }

  Future verifyFields(context) async {
    if (registerName == null ||
        registerName == "" ||
        initDate == null ||
        gameChoice == null) {
      return false;
    } else {
      if (checkDates(context) == true){
        if (register == null) {
          response = await _registerApi.postRegister(_auth.myId, gameChoice.idGame, registerName, initDate.toString(), endDate.toString());
        } else {
          response = await _registerApi.putRegister(_auth.myId, register.idRegister, gameChoice.idGame, registerName, initDate.toString(), endDate.toString());
        }
        return response;
      }
    }
  }

  Future delete() async {
    try {
      var response =
          await _registerApi.deleteRegister(_auth.myId, register.idRegister);
      return response;
    } catch (e) {
      return null;
    }
  }
}
