import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'publisher_store.g.dart';

class PublisherStore = _PublisherStoreBase with _$PublisherStore;

abstract class _PublisherStoreBase with Store {
  final AuthStore _auth = Modular.get();
  final IPublisherApi _publisherApi = Modular.get();

  @observable
  DateTime foundingDate;

  @observable
  DateTime closedDate;

  @observable
  String publisherName;

  @observable
  var response;

  @observable
  PublisherModel pub;

  @action
  setPub(PublisherModel value) => pub = value;

  void setPubValues(){
    DateTime dtFounding = DateTime.parse(pub.foundingDate);
    if(pub.closedDate != 'null') {
      DateTime dtClosed = DateTime.parse(pub.closedDate);
      closedDate = dtClosed;
    }
    foundingDate = dtFounding;
    publisherName = pub.name;
  }

  Future savePublisher() async {
    var returnResponse = await verifyFields();
    if (returnResponse == false) {
      return false;
    } else if (returnResponse == null) {
      return null;
    } else {
      return true;
    }
  }

  Future verifyFields() async {
    print('${publisherName},${foundingDate}');
    if (publisherName == null || publisherName == "" || foundingDate == null) {
      return false;
    } else {
      response = await _publisherApi.postPublisher(_auth.myId, publisherName,
          foundingDate.toString(), closedDate.toString());
      if (response == null) {
        return null;
      }
      return response;
    }
  }
}
