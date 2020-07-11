class GetPursesPending {}

class GetPursesSuccess {
  GetPursesSuccess(this.purses);
  dynamic purses;
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
