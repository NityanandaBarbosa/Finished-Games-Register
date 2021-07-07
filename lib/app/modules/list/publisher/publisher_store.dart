import 'package:finished_games_register/app/modules/list/list_store.dart';
import 'package:finished_games_register/app/modules/list/publisher/entities/publisher_model.dart';
import 'package:finished_games_register/app/modules/shared/auth/auth_store.dart';
import 'package:finished_games_register/app/modules/shared/services/publishers/publishers_api_interface.dart';
import 'package:finished_games_register/app/styles/system_pop_ups.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'publisher_store.g.dart';

class PublisherStore = _PublisherStoreBase with _$PublisherStore;

abstract class _PublisherStoreBase with Store {
  final AuthStore _auth = Modular.get();
  final ListStore listStore = Modular.get();
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

  @action
  setName(String value) => publisherName = value;

  @action
  setFoundingDate(DateTime value) => foundingDate = value;

  @action
  setClosedDate(DateTime value) => closedDate = value;

  @action
  setPubValues(){
    if(pub.closedDate != null) {
      setClosedDate(pub.closedDate);
    }
    setFoundingDate(pub.foundingDate);
    setName(pub.name);

  }

  Future savePublisher(context) async {
    var returnResponse = await saveRequest(context);

    if (returnResponse == false) {
      ShowAlertDialog(context, 'Fill the required fields!');
      return false;
    } else if (returnResponse == 'no connection') {
      ShowAlertDialog(context, 'Could not connect to server!');
      return null;
    } else if(returnResponse.statusCode == 200) {
      await listStore.refreshList();
      return true;
    }
  }

  bool verifyDates(context){
    if( closedDate != null ? (closedDate.compareTo(foundingDate)>0 || foundingDate == closedDate) : true ){
      return true;
    }else{
      ShowAlertDialog(context, "Closed Date are bigger then Founding Date!");
      return false;
    }
  }

  bool verifyField(){
    if (publisherName == null || publisherName == "" || foundingDate == null) {
      return false;
    }else{
      return true;
    }
  }

  Future saveRequest(context) async {
    if (verifyField() == false) {
      return false;
    }else{
      if(verifyDates(context) == true){
        if(pub == null){
          response = await _publisherApi.postPublisher(_auth.myId, publisherName,
              foundingDate.toString(), closedDate.toString());
        }else{
          response = await _publisherApi.putPublisher(_auth.myId, pub.idPub, publisherName,
              foundingDate.toString(), closedDate.toString());
        }
        return response;
      }
    }
  }

  Future delete() async{
    try{
      var response = await _publisherApi.deletePublisher(_auth.myId, pub.idPub);
      listStore.refreshList();
      return response;
    }catch(e){
      return null;
    }

  }
}
