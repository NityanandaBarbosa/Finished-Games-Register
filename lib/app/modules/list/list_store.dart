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
  var response;

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

  Future getSelected() async {
    if (selectedIndex == 0) {
      response = await _publisherApi.getPublisher(auth.myId);
    } else if (selectedIndex == 1) {
      response = await _gameApi.getGame(auth.myId);
    } else {
      response = await _registerApi.getRegister(auth.myId);
    }
    print("Retorno ${response.data}");
    return response.data;
  }

  Widget cardBase() {
    return Container(
      padding: EdgeInsets.all(3),
      height: 180,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
      ),
    );
  }

  Widget crudLists(sizewidth, sizeHeight) {
    if (selectedIndex == 0) {
      return response != null
          ? CircularProgressIndicator()
          : Container(
              width: sizewidth / 1.1,
              height: sizeHeight / 1.3,
              child: ListView(
                children: [],
              ),
            );
    } else if (selectedIndex == 1) {
      return response != null
          ? CircularProgressIndicator()
          : Container(
              width: sizewidth / 1.1,
              height: sizeHeight / 1.3,
              child: ListView(
                children: [
                  Text("Empty List"),
                ],
              ),
            );
    } else {
      return response == null
          ? CircularProgressIndicator()
          : Container(
              width: sizewidth / 1.1,
              height: sizeHeight / 1.3,
              child: ListView(
                children: [
                  Text("Empty List"),
                ],
              ),
            );
    }
  }
}
