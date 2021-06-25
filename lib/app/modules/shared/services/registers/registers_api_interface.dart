abstract class IRegisterApi {
  Future postRegister(id, idPublisher, idGame, name,
      [initDate = "", endDate = ""]);
  Future getRegister(id);
  Future putRegister(id, idRegister, idPublisher, idGame, name,
      [initDate = "", endDate = ""]);
  Future getSingleRegister(id, idRegister);
  Future deleteRegister(id, idRegister);
}
