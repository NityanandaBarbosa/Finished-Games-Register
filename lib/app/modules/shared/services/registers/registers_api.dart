import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/games/games_api_interface.dart';
import 'package:finished_games_register/app/modules/shared/services/registers/registers_api_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:core';

class RegisterApi implements IRegisterApi {
  final Dio dio;

  RegisterApi(this.dio);

  @override
  Future deleteRegister(id, idRegister) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register/${idRegister}/.json';
    var responseDec = await dio.delete(url);
  }

  @override
  Future getRegister(id) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future getSingleRegister(id, idRegister) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register/${idRegister}/.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future postRegister(id, idPublisher, idGame, name, [initDate = "", endDate = ""]) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register.json';
    var response = await dio.post(url, data:{'name': name, 'idGame': idGame, 'idPublisher': idPublisher, 'initDate': initDate, 'endDate': endDate});
    print("Try to post");
  }

  @override
  Future putRegister(id, idPublisher, idGame, name, [initDate = "", endDate = ""]) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/register.json';
    var response = await dio.put(url, data:{'name': name, 'idGame': idGame, 'idPublisher': idPublisher, 'initDate': initDate, 'endDate': endDate});
    print("Try to put");
  }
}
