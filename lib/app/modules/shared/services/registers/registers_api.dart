import 'package:finished_games_register/app/modules/list/register/entities/register_model.dart';
import 'package:finished_games_register/app/modules/shared/services/registers/registers_api_interface.dart';
import 'package:dio/dio.dart';
import 'dart:core';

class RegisterApi implements IRegisterApi {
  final Dio dio;

  RegisterApi(this.dio);

  @override
  Future deleteRegister(id, idRegister) async {
    var url =
        'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register/${idRegister}/.json';
    var responseDec = await dio.delete(url);
  }

  @override
  Future getRegister(id) async {
    var responseDec;
    List<RegisterModel> list = [];
    var url =
        'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register.json';
    //responseDec = await dio.get(url);
    //return responseDec.data;
    try{
      responseDec = await dio.get(url);
      var publishersJson = responseDec.data;
      publishersJson.forEach((key, value) {
        RegisterModel newRegister = new RegisterModel(idRegister: key, idGame: value["idGame"], initDate: value["initDate"], endDate: value["endDate"], name: value["name"]);
        list.add(newRegister);
      });
      print("Number of Register : ${list.length}");
      return list;
    }catch(e){
      return null;
    }
  }

  @override
  Future getSingleRegister(id, idRegister) async {
    var url =
        'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register/${idRegister}/.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future postRegister(id, idGame, name, [initDate = "", endDate = ""]) async {

    print("Try to post");
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register.json';
    var response;
    try{
      response= await dio.post(url, data: {'name': name, 'idGame': idGame, 'initDate': initDate, 'endDate': endDate});
      return response;
    }catch(e){
      return "no connection";
    }
  }

  @override
  Future putRegister(id, idRegister, idGame, name, [initDate = "", endDate = ""]) async {
    print("Try to put");
    var response;
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register/${idRegister}/.json';
    try{
      response = await dio.put(url, data: {'name': name, 'idGame': idGame, 'initDate': initDate, 'endDate': endDate});
      return response;
    }catch(e){
      return "no connection";
    }
  }
}
