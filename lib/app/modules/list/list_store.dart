import 'package:mobx/mobx.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;
abstract class _ListStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}