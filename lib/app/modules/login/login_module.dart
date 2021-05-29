import 'package:finished_games_register/app/modules/list/list_module.dart';
import 'package:finished_games_register/app/modules/list/list_page.dart';
import 'package:finished_games_register/app/modules/list/list_store.dart';
import 'package:finished_games_register/app/modules/login/login_Page.dart';
import 'package:finished_games_register/app/modules/login/login_store.dart';
import 'package:finished_games_register/app/styles/gradient_containers.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => ListStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    ChildRoute('/lists', child: (_, args) => ListPage()),
  ];
}
