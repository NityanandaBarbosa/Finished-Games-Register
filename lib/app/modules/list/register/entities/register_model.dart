import 'dart:convert';

class RegisterModel {
  var idGame;
  var idPub;
  var idRegister;
  var initDate;
  var endDate;

  RegisterModel(
      {this.idGame, this.idRegister, this.idPub, this.initDate, this.endDate});
}
