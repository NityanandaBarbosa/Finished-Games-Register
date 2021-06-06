abstract class IGameApi {
  Future postGame(id,idPublisher,name, [releaseDate = ""]);
  Future getGame(id);
  Future putGame(id,idPublisher,idGame,name, [releaseDate = ""]);
  Future getSingleGame(id,idGame);
  Future deleteGame(id,idGame);
}
