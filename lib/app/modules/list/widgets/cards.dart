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
              .pushNamed('/lists/publisher', arguments: publisher);
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
    int index;
    PublisherModel pub;

    if (game != null) {
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
                .pushNamed('/lists/game', arguments: [game, pub]);
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
                            game != null ? game.name : "-",
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
                                : "-",
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
                            ? "${game.releaseDate.day}/${game.releaseDate.month}/${game.releaseDate.year}"
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

  Widget cardRegister(register, listOfGames) {
    int index;
    GameModel game;

    if (register != null) {
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
                .pushNamed('/lists/register', arguments: [register, game]);
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
                            register != null ? register.name : "-",
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
                                : "-",
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
                            ? "${register.initDate.day}/${register.initDate.month}/${register.initDate.year}"
                            : "-") //publisher.foundingDate),
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
                        child: Text(register.endDate != null
                            ? "${register.endDate.day}/${register.endDate.month}/${register.endDate.year}"
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