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

  Future<bool> savePublisher() async{
    if(await verifyFields() == false){
      return false;
    }else{
      return true;
    }
  }

  Future<bool> verifyFields() async {
    print('${publisherName},${foundingDate}');
    if(publisherName == null || publisherName == "" || foundingDate == null){
      return false;
    }else{
      return true;
    }
  }

}
