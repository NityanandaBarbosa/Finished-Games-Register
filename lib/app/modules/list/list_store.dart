import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  AuthStore auth = Modular.get();
  final IPublisherApi _publisherApi = Modular.get();

  @observable
  String userId;

  @observable
  String userEmail;

  @observable
  int selectedIndex = 0;

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
    var pubs = await _publisherApi.getPublisher(auth.myId);
    print(pubs);
  }

  Widget cardBase(){
    return Container(
      padding: EdgeInsets.all(3),
      height: 180,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
      ),
    );
  }

  Widget crudLists(sizewidth, sizeHeight){
    if(selectedIndex == 0){
      return Container(
        width: sizewidth/1.1,
        height: sizeHeight/1.3,
        child: ListView(
          children: [
          ],
        ),
      );
    }else if(selectedIndex == 1){
      return Container(
        width: sizewidth/1.1,
        height: sizeHeight/1.3,
        child: ListView(
          children: [
        ],
        ),
      );
    }else{
      return Container(
        width: sizewidth/1.1,
        height: sizeHeight/1.3,
        child: ListView(
          children: [
          ],
        ),
      );
    }
  }

}
