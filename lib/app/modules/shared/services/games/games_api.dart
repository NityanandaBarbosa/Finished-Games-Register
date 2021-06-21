import 'package:finished_games_register/app/modules/list/game/entities/game_model.dart';
import 'package:finished_games_register/app/modules/shared/services/games/games_api_interface.dart';
import 'package:dio/dio.dart';
import 'dart:core';

import 'package:flutter/material.dart';

class GameApi implements IGameApi {
  final Dio dio;

  GameApi(this.dio);

  @override
  Future getGame(id) async {
    var responseDec;
    List<GameModel> list = [];
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game.json';
    try{
      responseDec = await dio.get(url);
      var publishersJson = responseDec.data;
      publishersJson.forEach((key, value) {
        GameModel newPub = new GameModel(idGame: key, idPub:value["idPublisher"],releaseDate: value["releaseDate"], name: value["name"]);
        list.add(newPub);
      });
      print("Number of Games : ${list.length}");
      return list;
    }catch(e){
      return null;
    }
  }

  @override
  Future getSingleGame(id, idGame) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game/${idGame}/.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future postGame(id, idPublisher, name, [releaseDate = ""]) async {
    print("Try to post");
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game.json';
    var response;
    try{
      response = await dio.post(url, data:{'name': name, 'idPublisher': idPublisher, 'releaseDate': releaseDate});
      return response.data;
    }catch(e){
      return null;
    }
  }

  @override
  Future putGame(id, idPublisher, idGame, name, [releaseDate = ""]) async {
    print("Try to put");
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game/${idGame}/.json';
    var response;
    try{
      response = await dio.put(url, data:{'name': name, 'idPublisher': idPublisher, 'releaseDate': releaseDate});
      return response.data;
    }catch(e){
      return null;
    }
  }

  @override
  Future deleteGame(id, idGame) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game/${idGame}/.json';
    var responseDec = await dio.delete(url);
  }
}
