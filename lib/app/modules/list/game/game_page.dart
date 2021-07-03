import 'package:finished_games_register/app/modules/list/game/entities/game_model.dart';
import 'package:finished_games_register/app/modules/list/game/game_store.dart';
import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
import 'package:flutter/material.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart'
    as gradientComp;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../list_store.dart';

class GamePage extends StatefulWidget {
  final String title;
  const GamePage({key, this.title = 'GamePage'}) : super(key: key);
  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends ModularState<GamePage, GameStore> {
  final GameStore store = Modular.get();
  final ListStore listStore = Modular.get();

  final _formKey = GlobalKey<FormState>();

  var argsGame = Modular.args.data;

  @override
  void initState() {
    try {
      if (argsGame != null) {
        store.setGame(argsGame[0]);
        store.setGameValues();
        store.setPubChoice(argsGame[1]);
      }
    } catch (e) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget gamePage(context) {
      return Container(
        alignment: Alignment.topCenter,
        child: Form(
          key: _formKey,
          child: Wrap(
            alignment: WrapAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                child: Text(
                  "Name : ",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "*",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: TextFormField(
                  initialValue: store.gameName != null ? store.gameName : null,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Fill in the field';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Publisher Name",
                    labelText: "Name",
                    labelStyle: TextStyle(fontSize: 13, color: Colors.black54),
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black54)),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.business_sharp),
                    ),
                  ),
                  onChanged: (value) {
                    store.setName(value);
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 10, right: 5, bottom: 10),
                    child: Text(
                      "Publisher : ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "*",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 3),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        hint: store.pubChoice == null
                            ? Text("Select Publisher")
                            : null,
                        value: store.pubChoice,
                        decoration: InputDecoration(
                          //hintText: "Publisher Name",
                          //labelText: "Name",
                          labelStyle:
                          TextStyle(fontSize: 13, color: Colors.black54),
                          border: OutlineInputBorder(
                              borderSide:
                              new BorderSide(color: Colors.black54)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                                store.setPubChoice(null);
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Select a Publisher';
                          }
                          return null;
                        },
                        onChanged: (value) {
                            store.setPubChoice(value);
                        },
                        items: listStore.listOfPubs != null
                            ? listStore.listOfPubs.map((PublisherModel pub) {
                          return new DropdownMenuItem<PublisherModel>(
                            child: new Text(
                              pub.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: pub,
                          );
                        }).toList()
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 10, right: 5, bottom: 10),
                        child: Text(
                          "Release Date : ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "*",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    child: TextFormField(
                      validator: (value) {
                        if (store.releaseDate == null ||
                            store.releaseDate == "") {
                          return 'Fill in the field';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      readOnly: true,
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: store.releaseDate == null
                                ? DateTime.now()
                                : store.releaseDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100))
                            .then((date) {
                          if (date != null && date != store.releaseDate) {
                              store.setReleaseDate(date);
                          }
                        });
                      },
                      decoration: InputDecoration(
                        hintText: (store.releaseDate == null
                            ? "-"
                            : '${store.releaseDate.day}/${store.releaseDate.month}/${store.releaseDate.year}'),
                        labelStyle:
                        TextStyle(fontSize: 13, color: Colors.black),
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black54)),
                        suffixIcon:
                        IconButton(icon: Icon(Icons.date_range_outlined)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return Observer(builder: (_) {
      return Scaffold(
        appBar: argsGame == null
            ? gradientComp.appBarGradient(context, "Game Page")
            : gradientComp.appBarDelete(
            context, store.gameName, store.delete),
        body: gradientComp.backgroundGradient(context, gamePage(context)),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () async {
            if (_formKey.currentState.validate()) {}
            var responseSave = await store.saveGame(context);
            if (responseSave == true) {
              Modular.to.pop();
            }
          },
          child: Icon(Icons.save_rounded),
        ),
      );
    },
    );
  }
}
