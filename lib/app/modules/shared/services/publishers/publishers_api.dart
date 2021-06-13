import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api_interface.dart';
import 'package:dio/dio.dart';
import 'dart:core';

class PublisherApi implements IPublisherApi {
  final Dio dio;

  PublisherApi(this.dio);
  
  @override
  Future getPublisher(id) async {
    var responseDec;
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher.json';
    try{
       responseDec = await dio.get(url);
       return responseDec.data;
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
    var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user/${id}/publisher/${idPublisher}/.json';
    var response = await dio.post(url, data:{'name': name, 'foundingDate': foundingDate, 'closedDate': closedDate});
    print("Try to put");
    return response.data;
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
    return responseDec.data;
  }
}
