import 'package:finished_games_register/app/modules/shared/services/games/games_api_interface.dart';
import 'package:dio/dio.dart';
import 'dart:core';

import 'package:flutter/material.dart';

class GameApi implements IGameApi {
  final Dio dio;

  GameApi(this.dio);

  @override
  Future getGame(id) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future getSingleGame(id, idGame) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game/${idGame}/.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future postGame(id, idPublisher, name, [releaseDate = ""]) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game.json';
    var response = await dio.post(url, data:{'name': name, 'idPublisher': idPublisher, 'releaseDate': releaseDate});
    print("Try to post");
  }

  @override
  Future putGame(id, idPublisher, idGame, name, [releaseDate = ""]) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game/${idGame}/.json';
    var response = await dio.put(url, data:{'name': name, 'idPublisher': idPublisher, 'releaseDate': releaseDate});
    print("Try to put");
  }

  @override
  Future deleteGame(id, idGame) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/game/${idGame}/.json';
    var responseDec = await dio.delete(url);
  }
}
