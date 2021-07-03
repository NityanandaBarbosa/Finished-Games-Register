import 'dart:convert';

class GameModel {
  String idGame;
  String idPub;
  DateTime releaseDate;
  String name;

  GameModel({
    this.idGame,
    this.idPub,
    this.releaseDate,
    this.name
  });
}