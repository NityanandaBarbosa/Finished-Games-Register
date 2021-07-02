import 'dart:async';

import 'package:finished_games_register/app/modules/list/game/entities/game_model.dart';
import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
import 'package:finished_games_register/app/modules/list/register/entities/register_model.dart';
import 'package:finished_games_register/app/modules/list/widgets/cards.dart';
import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/games/games_api_interface.dart';
import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api_interface.dart';
import 'package:finished_games_register/app/modules/shared/services/registers/registers_api_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  final AuthStore auth = Modular.get();
  final IPublisherApi _publisherApi = Modular.get();
  final IGameApi _gameApi = Modular.get();
  final IRegisterApi _registerApi = Modular.get();

  @observable
  String userId;

  @observable
  String userEmail;

  @observable
  int selectedIndex = 0;

  @observable
  List<PublisherModel> responsePubs;

  @observable
  List<GameModel> responseGames;

  @observable
  List<RegisterModel> responseRegister;

  @observable
  Future futureLoadLists;

  @action
  setFutureLoadList(Future value) => futureLoadLists = value;

  @action
  setUser(String value) => userId = value;

  @action
  setUserEmail(String value) => userEmail = value;

  @action
  setIndex(int value) => selectedIndex = value;

  Future getCredential() async {
    var userId = await auth.getUserCredential();
    setUser(userId.user.uid);
    setUserEmail(userId.user.email);
  }

  Future openCrud() async {
    if (selectedIndex == 0) {
      Modular.to.pushNamed('/lists/publisher');
    } else if (selectedIndex == 1) {
      Modular.to.pushNamed('/lists/game');
    } else {
      Modular.to.pushNamed('/lists/register');
    }
  }
  @action
  Future getCRUDsData() async {
    responsePubs = await _publisherApi.getPublisher(auth.myId);
    responseGames = await _gameApi.getGame(auth.myId);
    responseRegister = await _registerApi.getRegister(auth.myId);
    if(responsePubs == null || responseGames == null || responseRegister == null) {
      return false;
    }
    return true;
  }

  Future refreshList() async{
    var response = getCRUDsData();
    setFutureLoadList(response);
  }
}
