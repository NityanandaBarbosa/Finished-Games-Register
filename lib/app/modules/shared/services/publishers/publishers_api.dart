import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:core';

class PublisherApi implements IPublisherApi {
  final Dio dio;

  PublisherApi(this.dio);
  
  @override
  Future getPublisher(id) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future postPublisher(id,name, foundingDate,[closedDate = ""]) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher.json';
    var response = await dio.post(url, data:{'name': name, 'foundingDate': foundingDate, 'closedDate': closedDate});
    print("Try to post");
  }

  @override
  Future putPublisher(id, idPublisher, name, foundingDate, closedDate) async{
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher/${idPublisher}/.json';
    var response = await dio.post(url, data:{'name': name, 'foundingDate': foundingDate, 'closedDate': closedDate});
    print("Try to put");
  }

  @override
  Future getSinglePublisher(id, idPublisher) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher/${idPublisher}/.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future deletePublisher(id, idPublisher) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher/${idPublisher}/.json';
    var responseDec = await dio.delete(url);
  }
}
