class PurseModel {
  PurseModel({
    this.idUser,
    this.name,
    this.categoryId,
    this.balance,
    this.id,
  });
  final String idUser;
  final String name;
  final String categoryId;
  final int balance;
  final String id;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'idUser': idUser,
      'name': name,
      'categoryId': categoryId,
      'balance': balance,
      'id': id,
    };
  }

  // ignore: sort_constructors_first
  factory PurseModel.fromJson(Map<String, dynamic> json) {
    return PurseModel(
        idUser: json['idUser'].toString(),
        name: json['name'].toString(),
        categoryId: json['categoryId'].toString(),
        balance: json['balance'] as int,
        id: json['_id'].toString());
  }

  static PurseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return PurseModel(
        idUser: map['idUser'].toString(),
        name: map['name'].toString(),
        categoryId: map['categoryId'].toString(),
        balance: map['balance'] as int,
        id: map['_id'].toString());
  }
}
