import 'package:dio/src/dio.dart';
import 'package:finished_games_register/app/modules/list/list_Page.dart';
import 'package:finished_games_register/app/modules/list/list_store.dart';
import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ListPage()),
  ];

  static set dio(Dio dio) {}
}
