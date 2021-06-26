abstract class IRegisterApi {
  Future postRegister(id, idGame, name, [initDate = "", endDate = ""]);
  Future getRegister(id);
  Future putRegister(id, idRegister, idGame, name, [initDate = "", endDate = ""]);
  Future getSingleRegister(id, idRegister);
  Future deleteRegister(id, idRegister);
}
