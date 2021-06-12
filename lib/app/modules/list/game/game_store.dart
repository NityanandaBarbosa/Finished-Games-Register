import 'package:mobx/mobx.dart';

part 'game_store.g.dart';

class GameStore = _GameStoreBase with _$GameStore;
abstract class _GameStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}