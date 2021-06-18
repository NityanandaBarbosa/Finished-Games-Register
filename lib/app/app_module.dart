import 'package:finished_games_register/app/modules/login/login_module.dart';
import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/auth/repositories/auth_repository.dart';
import 'package:finished_games_register/app/modules/shared/auth/repositories/auth_repository_interface.dart';
import 'package:finished_games_register/app/modules/shared/services/users/users_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/home/home_module.dart';
import 'package:dio/dio.dart';

import 'modules/shared/services/publishers/publishers_api.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthRepository()),
    Bind.lazySingleton((i) => UsersApi(dio = Dio())),
    Bind.lazySingleton((i) => PublisherApi(dio = Dio())),
    Bind.lazySingleton((i) => AuthStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
  ];

  static set dio(Dio dio) {}
}
