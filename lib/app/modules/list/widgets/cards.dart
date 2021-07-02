import 'package:finished_games_register/app/modules/list/game/entities/game_model.dart';
import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

  Widget cardPublisher(publisher) {
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
                          '${publisher.foundingDate.day}/${publisher.foundingDate.month}/${publisher.foundingDate.year}') //publisher.foundingDate),
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
                      child: Text(publisher.closedDate == null
                          ? "-"
                          : '${publisher.closedDate.day}/${publisher.closedDate.month}/${publisher.closedDate.year}') //publisher.closedDate),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardGame(game, listOfPublishers) {
    DateTime dtRelease;
    int index;
    PublisherModel pub;

    if (game != null) {
      dtRelease = DateTime.parse(game.releaseDate);
      for (index = 0; index < listOfPublishers.length; index++) {
        if (listOfPublishers[index].idPub == game.idPub) {
          pub = listOfPublishers[index];
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
                                ? listOfPublishers[index].name
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

  Widget cardRegister(register, listOfGames) {
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
      for (index = 0; index < listOfGames.length; index++) {
        if (listOfGames[index].idGame == register.idGame) {
          game = listOfGames[index];
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
                                ? listOfGames[index].name
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