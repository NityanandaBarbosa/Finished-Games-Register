import 'dart:convert';

class RegisterModel {
  String name;
  String idGame;
  String idRegister;
  DateTime initDate;
  DateTime endDate;

  RegisterModel(
      {this.idGame, this.idRegister,this.name, this.initDate, this.endDate});
}
