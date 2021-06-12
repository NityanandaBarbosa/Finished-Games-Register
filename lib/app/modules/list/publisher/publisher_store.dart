import 'package:mobx/mobx.dart';

part 'publisher_store.g.dart';

class PublisherStore = _PublisherStoreBase with _$PublisherStore;

abstract class _PublisherStoreBase with Store {
  @observable
  DateTime foundingDate;

  @observable
  DateTime closedDate;

  @observable
  String publisherName;

}
