import 'dart:convert';

class RegisterModel {
  var name;
  var idGame;
  var idRegister;
  var initDate;
  var endDate;

  RegisterModel(
      {this.idGame, this.idRegister,this.name, this.initDate, this.endDate});
}
