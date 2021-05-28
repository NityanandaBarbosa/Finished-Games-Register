import 'package:register_of_finished_games/app/app_widget.dart';
import 'package:register_of_finished_games/app/modules/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/login', child: (_, __) => Login()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
