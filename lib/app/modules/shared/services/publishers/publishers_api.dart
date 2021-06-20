import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api_interface.dart';
import 'package:dio/dio.dart';
import 'dart:core';

import 'package:flutter/material.dart';

class PublisherApi implements IPublisherApi {
  final Dio dio;

  PublisherApi(this.dio);
  
  @override
  Future getPublisher(id) async {
    var responseDec;
    List<PublisherModel> list = [];
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher.json';
    try{
       responseDec = await dio.get(url);
       var publishersJson = responseDec.data;
       publishersJson.forEach((key, value) {
         PublisherModel newPub = new PublisherModel(idPub: key,closedDate: value["closedDate"], foundingDate: value["foundingDate"],name: value["name"]);
         list.add(newPub);
       });
       print("Number of Publishers : ${list.length}");
       return list;
    }catch(e){
      return null;
    }
  }

  @override
  Future postPublisher(id,name, foundingDate,[closedDate = ""]) async {
    var response;
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher.json';
    try{
      response = await dio.post(url, data:{'name': name, 'foundingDate': foundingDate, 'closedDate': closedDate});
      return response.data;
    }catch(e){
      return null;
    }
  }

  @override
  Future putPublisher(id, idPublisher, name, foundingDate, closedDate) async {
    print("Try to put / ID ${id} / PUB ID ${idPublisher}");
    var response;
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher/${idPublisher}/.json';
    try{
      response = await dio.patch(url, data:{'closedDate': closedDate,'foundingDate': foundingDate, 'name': name});
      return response.data;
    }catch(e){
      return null;
    }
  }

  @override
  Future getSinglePublisher(id, idPublisher) async {
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher/${idPublisher}/.json';
    var responseDec = await dio.get(url);
    return responseDec.data;
  }

  @override
  Future deletePublisher(id, idPublisher) async {
    var response;
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher/${idPublisher}/.json';
    try{
      response = await dio.delete(url);
      print("RESPOSTA ${response.statusCode}");
      return response;
    }catch(e){
      print("RESPOSTA ${response.statusCode}");
      return null;
    }
  }
}
