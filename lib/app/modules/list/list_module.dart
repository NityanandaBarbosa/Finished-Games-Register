import 'package:dio/src/dio.dart';
import 'package:finished_games_register/app/modules/list/list_Page.dart';
import 'package:finished_games_register/app/modules/list/list_store.dart';
import 'package:finished_games_register/app/modules/list/publisher/publisher_page.dart';
import 'package:finished_games_register/app/modules/list/publisher/publisher_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'game/game_page.dart';
import 'game/game_store.dart';
import 'register/register_page.dart';
import 'register/register_store.dart';

class ListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ListStore()),
    Bind.lazySingleton((i) => PublisherStore()),
    Bind.lazySingleton((i) => GameStore()),
    Bind.lazySingleton((i) => RegisterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ListPage()),
    ChildRoute('/publisher', child: (_, args) => PublisherPage()),
    ChildRoute('/game', child: (_, args) => GamePage()),
    ChildRoute('/register', child: (_, args) => RegisterPage()),
  ];

  static set dio(Dio dio) {}
}
