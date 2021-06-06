abstract class IPublisherApi {
  Future postPublisher(id,name, foundingDate, [closedDate = ""]);
  Future getPublisher(id);
  Future putPublisher(id,idPublisher,name, foundingDate, closedDate);
  Future getSinglePublisher(id,idPublisher);
}
