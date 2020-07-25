class PurseModel {
  PurseModel({
    this.idUser,
    this.name,
    this.categoryId,
    this.balance,
  });
  final String idUser;
  final String name;
  final String categoryId;
  final int balance;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'idUser': idUser,
      'name': name,
      'categoryId': categoryId,
      'balance': balance
    };
  }

  // ignore: sort_constructors_first
  factory PurseModel.fromJson(Map<String, dynamic> json) {
    return PurseModel(
      idUser: json['idUser'].toString(),
      name: json['name'].toString(),
      categoryId: json['categoryId'].toString(),
      balance: json['balance'] as int,
    );
  }

  static PurseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return PurseModel(
        idUser: map['idUser'].toString(),
        name: map['name'].toString(),
        categoryId: map['categoryId'].toString(),
        balance: map['balance'] as int);
  }
}
