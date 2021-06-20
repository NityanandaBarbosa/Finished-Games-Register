import 'package:finished_games_register/app/modules/list/publisher/publisher_page.dart';
import 'package:finished_games_register/app/modules/list/publisher/publisher_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PublisherModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PublisherStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PublisherPage()),
  ];
}
