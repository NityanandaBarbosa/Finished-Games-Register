import 'package:finished_games_register/app/modules/shared/services/users/users_api_interface.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:core';

class UsersApi implements IUsersApi {
  final Dio dio;

  var url = 'https://finishedgamesregister-default-rtdb.firebaseio.com/user.json';

  UsersApi(this.dio);

  @override
  Future getUsers()async {
    var responseDec = await dio.get(url);
    //var response = await get(url);
    //var responseDec = jsonDecode(response.body);
    return responseDec.data;
  }

  @override
  Future postUser(user) async {
    print("userId");
    print(user.user.email);
    print(user.user.uid);
    var response = await dio.post(url, data:{'userId': user.user.uid, 'email': user.user.email});
    return response.data['name'];
  }
}
