import 'dart:async';

import 'package:finished_games_register/app/modules/list/game/entities/game_model.dart';
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
  List<GameModel> responseGames;

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
      Modular.to.pushReplacementNamed('/lists/publisher');
    } else if (selectedIndex == 1) {
      Modular.to.pushReplacementNamed('/lists/game');
    } else {
      Modular.to.pushReplacementNamed('/lists/register');
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

  Widget cardPublisher(publisher) {
    DateTime dtFounding = DateTime.parse(publisher.foundingDate);
    DateTime dtClosed;
    try {
      dtClosed = DateTime.parse(publisher.closedDate);
    } catch (e) {}

    return Container(
      padding: EdgeInsets.all(3),
      height: 150,
      width: double.maxFinite,
      child: InkWell(
        onTap: () {
          Modular.to
              .pushReplacementNamed('/lists/publisher', arguments: publisher);
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
                  Container(
                    child: Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                        child: Text(
                          publisher.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
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
                      child: Text(
                          '${dtFounding.day}/${dtFounding.month}/${dtFounding.year}') //publisher.foundingDate),
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
                      child: Text(publisher.closedDate == "null"
                          ? "-"
                          : '${dtClosed.day}/${dtClosed.month}/${dtClosed.year}') //publisher.closedDate),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardGame(game) {
    DateTime dtRelease;
    int index;
    PublisherModel pub;

    if (game != null) {
      dtRelease = DateTime.parse(game.releaseDate);
      for (index = 0; index < responsePubs.length; index++) {
        if (responsePubs[index].idPub == game.idPub) {
          pub = responsePubs[index];
          break;
        }
      }

      return Container(
        padding: EdgeInsets.all(3),
        height: 150,
        width: double.maxFinite,
        child: InkWell(
          onTap: () {
            Modular.to
                .pushReplacementNamed('/lists/game', arguments: [game, pub]);
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
                    Container(
                      child: Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                          child: Text(
                            game != null ? game.name : "AQUIIIII",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 1, 5),
                      child: Text(
                        "Publisher : ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                          child: Text(
                            index != null
                                ? responsePubs[index].name
                                : "AQUIIIII",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 1, 5),
                      child: Text(
                        "Release Date : ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
                        child: Text(game != null
                            ? "${dtRelease.day}/${dtRelease.month}/${dtRelease.year}"
                            : "AQUIIIII") //publisher.foundingDate),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget cardRegister(register) {
    DateTime dtInit;
    DateTime dtEnd;
    int index;
    GameModel game;

    if (register != null) {
      dtInit = DateTime.parse(register.initDate);
      try{
        dtEnd = DateTime.parse(register.endDate);
      }catch(e){
        print("Empty end date!");
      }
      for (index = 0; index < responseGames.length; index++) {
        if (responseGames[index].idGame == register.idGame) {
          game = responseGames[index];
          break;
        }
      }

      return Container(
        padding: EdgeInsets.all(3),
        height: 150,
        width: double.maxFinite,
        child: InkWell(
          onTap: () {
            Modular.to
                .pushReplacementNamed('/lists/register', arguments: [register, game]);
          },
          child: Card(
            elevation: 3,
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 1, 5),
                      child: Text(
                        "Name : ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                          child: Text(
                            register != null ? register.name : "AQUIIIII",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 1, 5),
                      child: Text(
                        "Game : ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                          child: Text(
                            index != null
                                ? responseGames[index].name
                                : "AQUIIIII",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 1, 5),
                      child: Text(
                        "Init Date : ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                        child: Text(game != null
                            ? "${dtInit.day}/${dtInit.month}/${dtInit.year}"
                            : "AQUIIIII") //publisher.foundingDate),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 1, 5),
                      child: Text(
                        "End Date : ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                        child: Text(dtEnd != null
                            ? "${dtEnd.day}/${dtEnd.month}/${dtEnd.year}"
                            : "-") //publisher.foundingDate),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
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
                    return cardPublisher(responsePubs[index]);
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
              child: ListView.builder(
                  itemCount: responseGames.length,
                  itemBuilder: (context, index) {
                    return cardGame(responseGames[index]);
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
    } else {
      return responseRegister != null
          ? Container(
              width: sizewidth / 1.1,
              height: sizeHeight / 1.3,
              child: ListView.builder(
                  itemCount: responseRegister.length,
                  itemBuilder: (context, index) {
                    return cardRegister(responseRegister[index]);
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
