import 'package:manageYourMoneyMobile/store/models/purse.model.dart';

class GetPursesPending {}

class GetPursesSuccess {
  GetPursesSuccess(this.purses);
  List<PurseModel> purses;
}

class Purse {
  Purse(this.idUser, this.name, this.balance, this.categoryId);
  String idUser;
  String name;
  int balance;
  String categoryId;
}

class GetPursesError {}

class CreatePursePending {
  CreatePursePending(this.idUser, this.name, this.balance, this.categoryId);
  String idUser;
  String name;
  int balance;
  String categoryId;
}
