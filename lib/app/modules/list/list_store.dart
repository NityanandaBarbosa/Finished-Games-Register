import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/games/games_api_interface.dart';
import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api_interface.dart';
import 'package:finished_games_register/app/modules/shared/services/registers/registers_api_interface.dart';
import 'package:finished_games_register/app/modules/shared/services/users/users_api_interface.dart';
import 'package:finished_games_register/app/styles/system_pop_ups.dart';
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
  var responseGames;

  @observable
  var responseRegister;

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

  Future getCRUDs() async {
    try {
      responsePubs = await _publisherApi.getPublisher(auth.myId);
      responseGames = await _gameApi.getGame(auth.myId);
      responseRegister = await _registerApi.getRegister(auth.myId);
      return true;
    } catch (e) {
      print("FALHOU  ${e}");
      responsePubs = null;
      responseGames = null;
      responseRegister = null;
      return false;
    }
  }

  Widget cardBase(publisher) {
    DateTime dtFounding = DateTime.parse(publisher.foundingDate);
    DateTime dtClosed;
    try{
      dtClosed = DateTime.parse(publisher.closedDate);
    }catch(e){

    }

    return Container(
      padding: EdgeInsets.all(3),
      height: 150,
      width: double.maxFinite,
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed('/lists/publisher',
              arguments: publisher);
        },
        child: Card(
          elevation: 3,
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 1, 5),
                    child: Text(
                      "Name : ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                    child: Text(publisher.name),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 1, 5),
                    child: Text(
                      "Founding Date : ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
                    child: Text('${dtFounding.day}/${dtFounding.month}/${dtFounding.year}')//publisher.foundingDate),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 1, 5),
                    child: Text(
                      "Closed Date : ",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
                    child: Text(publisher.closedDate == "null" ? "-" : '${dtClosed.day}/${dtClosed.month}/${dtClosed.year}')//publisher.closedDate),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget crudLists(sizewidth, sizeHeight) {
    if (selectedIndex == 0) {
      return responsePubs != null
          ? Container(
              width: sizewidth / 1.1,
              height: sizeHeight / 1.3,
              child: ListView.builder(
                  itemCount: responsePubs.length,
                  itemBuilder: (context, index) {
                    return cardBase(responsePubs[index]);
                  }),
            )
          : Container(
              width: sizewidth / 1.1,
              height: sizeHeight / 1.3,
              child: ListView(
                children: [
                  Text("Empty List"),
                ],
              ),
            );
    } else if (selectedIndex == 1) {
      return responseGames != null
          ? Container(
              width: sizewidth / 1.1,
              height: sizeHeight / 1.3,
              child: ListView(
                children: [
                  Text("Empty List"),
                ],
              ),
            )
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
      return responseRegister != null
          ? Container(
              width: sizewidth / 1.1,
              height: sizeHeight / 1.3,
              child: ListView(
                children: [
                  Text("Something Here"),
                ],
              ),
            )
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

  Widget crudListsFailed(sizewidth, sizeHeight) {
    if (selectedIndex == 0) {
      return Container(
        alignment: Alignment.center,
        width: sizewidth / 1.1,
        height: sizeHeight / 1.3,
        child: ListView(
          children: [
            Center(
              child: Text("Error"),
            )
          ],
        ),
      );
    } else if (selectedIndex == 1) {
      return Container(
        alignment: Alignment.center,
        width: sizewidth / 1.1,
        height: sizeHeight / 1.3,
        child: ListView(
          children: [
            Center(
              child: Text("Error"),
            )
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        width: sizewidth / 1.1,
        height: sizeHeight / 1.3,
        child: ListView(
          children: [
            Center(
              child: Text("Error"),
            )
          ],
        ),
      );
    }
  }

  Widget crudListsWaiting(sizewidth, sizeHeight) {
    if (selectedIndex == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (selectedIndex == 1) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
