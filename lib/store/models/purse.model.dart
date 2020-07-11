import 'package:flutter/cupertino.dart';

class PurseModel {
  PurseModel({
    @required this.idUser,
    @required this.name,
    @required this.categoryId,
    this.balance,
  });
  final String idUser;
  final String name;
  final String categoryId;
  final int balance;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'name': name,
      'categoryId': categoryId,
      'balance': balance
    };
  }

  static PurseModel fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
    return PurseModel(
        idUser: map['idUser'].toString(),
        name: map['name'].toString(),
        categoryId: map['categoryId'].toString(),
        balance: map['balance'] as int);
  }
}
