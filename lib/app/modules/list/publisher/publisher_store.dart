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

  void setPubValues(){
    //DateTime dtFounding = pub.foundingDate;
    if(pub.closedDate != null) {
      //DateTime dtClosed = DateTime.parse(pub.closedDate);
      closedDate = pub.closedDate;
    }
    foundingDate = pub.foundingDate;
    publisherName = pub.name;
  }

  Future savePublisher(context) async {
    var returnResponse = await verifyFields(context);
    if (returnResponse == false) {
      ShowAlertDialog(context, 'Fill the required fields!');
      return false;
    } else if (returnResponse == null) {
      ShowAlertDialog(context, 'Could not connect to server!');
      return null;
    } else if(returnResponse != "none") {
      return true;
    }
  }

  Future verifyFields(context) async {
    if (publisherName == null || publisherName == "" || foundingDate == null) {
      return false;
    } else {
      if( closedDate != null ? closedDate.compareTo(foundingDate)>0 : true ){
        if(pub == null){
          response = await _publisherApi.postPublisher(_auth.myId, publisherName,
              foundingDate.toString(), closedDate.toString());
        }else{
          response = await _publisherApi.putPublisher(_auth.myId, pub.idPub, publisherName,
              foundingDate.toString(), closedDate.toString());
        }
      }else{
        ShowAlertDialog(context, "Closed Date are bigger then Founding Date!");
        return "none";
      }
      return response;
    }
  }

  Future delete() async{
    try{
      var response = await _publisherApi.deletePublisher(_auth.myId, pub.idPub);
      return response;
    }catch(e){
      return null;
    }

  }
}
