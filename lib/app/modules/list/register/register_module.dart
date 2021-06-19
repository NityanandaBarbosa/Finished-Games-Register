import 'package:finished_games_register/app/modules/list/register/register_Page.dart';
import 'package:finished_games_register/app/modules/list/register/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RegisterPage()),
  ];
}
