import 'package:finished_games_register/app/modules/list/game/entities/game_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:finished_games_register/app/modules/list/register/register_store.dart';
import 'package:flutter/material.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart'
    as gradientComp;

import '../list_store.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  final RegisterStore store = Modular.get();
  final ListStore listStore = Modular.get();

  final _formKey = GlobalKey<FormState>();

  var argsRegister = Modular.args.data;

  @override
  void initState() {
    try {
      if (argsRegister != null) {
        store.setRegister(argsRegister[0]);
        store.setRegisterValues();
        store.setGameChoice(argsRegister[1]);
      }
    } catch (e) {}
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fullMediaWidth = MediaQuery.of(context).size.width;
    final fullMediaHeight = MediaQuery.of(context).size.height;

    Widget registerPage(context) {
      return Container(
        alignment: Alignment.topCenter,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Wrap(
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
                      initialValue: store.registerName != null
                          ? store.registerName
                          : null,
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
                        labelStyle:
                            TextStyle(fontSize: 13, color: Colors.black54),
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black54)),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.business_sharp),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          store.setName(value);
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, top: 10, right: 5, bottom: 10),
                        child: Text(
                          "Game : ",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
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
                            hint: store.gameChoice == null
                                ? Text("Select Game")
                                : null,
                            value: store.gameChoice,
                            decoration: InputDecoration(
                              //hintText: "Publisher Name",
                              //labelText: "Name",
                              labelStyle: TextStyle(
                                  fontSize: 13, color: Colors.black54),
                              border: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.black54)),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.refresh),
                                onPressed: () {
                                  setState(() {
                                    store.gameChoice = null;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return 'Select a Game';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                store.gameChoice = value;
                              });
                            },
                            items: listStore.responseGames != null
                                ? listStore.responseGames
                                    .map((GameModel game) {
                                    return new DropdownMenuItem<GameModel>(
                                      child: new Text(
                                        game.name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      value: game,
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
                              "Game Release Date : ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: (store.gameChoice == null
                                ? "-"
                                : '${store.gameChoice.releaseDate.day}/${store.gameChoice.releaseDate.month}/${store.gameChoice.releaseDate.year}'),
                            labelStyle:
                            TextStyle(fontSize: 13, color: Colors.black),
                            border: OutlineInputBorder(
                                borderSide:
                                new BorderSide(color: Colors.black54)),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.date_range_outlined)),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10, right: 5, bottom: 10),
                            child: Text(
                              "Init Date : ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
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
                            if (store.initDate == null ||
                                store.initDate == "") {
                              return 'Fill in the field';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          readOnly: true,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: store.initDate == null
                                        ? DateTime.now()
                                        : store.initDate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100))
                                .then((date) {
                              if (date != null && date != store.initDate) {
                                setState(() {
                                  store.setInitDate(date);
                                });
                              }
                            });
                          },
                          decoration: InputDecoration(
                            hintText: (store.initDate == null
                                ? "-"
                                : '${store.initDate.day}/${store.initDate.month}/${store.initDate.year}'),
                            labelStyle:
                                TextStyle(fontSize: 13, color: Colors.black),
                            border: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.black54)),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.date_range_outlined)),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, top: 10, right: 5, bottom: 10),
                            child: Text(
                              "End Date : ",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 30),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          readOnly: true,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: store.endDate == null
                                        ? DateTime.now()
                                        : store.endDate,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100))
                                .then((date) {
                              if (date != null && date != store.endDate) {
                                setState(() {
                                  store.setEndDate(date);
                                });
                              }
                            });
                          },
                          decoration: InputDecoration(
                            hintText: (store.endDate == null
                                ? "-"
                                : '${store.endDate.day}/${store.endDate.month}/${store.endDate.year}'),
                            labelStyle:
                                TextStyle(fontSize: 13, color: Colors.black),
                            border: OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.black54)),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.date_range_outlined)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Observer(builder: (_){
      return Scaffold(
        appBar: store.register == null ? gradientComp.appBarGradient(context, "Register Page") : gradientComp.appBarDelete(context, store.registerName, store.delete),
        body: gradientComp.backgroundGradient(context, registerPage(context)),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () async {
            if (_formKey.currentState.validate()) {}
            var responseSave = await store.saveRegister(context);
            if (responseSave == true) {
              store.response == null ? CircularProgressIndicator() : null;
              Modular.to.pop();
            }
          },
          child: Icon(Icons.save_rounded),
        ),
      );
    },);

  }
}
