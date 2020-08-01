import 'package:flutter/material.dart';

class TransactionModel {
  TransactionModel({
    this.purseIdTo,
    this.purseIdFrom,
    this.incomeId,
    this.categoryId,
    this.expenceId,
    this.suma,
    this.data,
    this.name,
    this.description,
  });
  final String purseIdTo;
  final String purseIdFrom;
  final String incomeId;
  final String categoryId;
  final String expenceId;
  final int suma;
  final String data;
  final String name;
  final String description;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'purseIdTo': purseIdTo,
      'purseIdFrom': purseIdFrom,
      'incomeId': incomeId,
      'categoryId': categoryId,
      'expenceId': expenceId,
      'suma': suma,
      'data': data,
      'name': name,
      'description': description,
    };
  }

  // ignore: sort_constructors_first
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      purseIdTo: json['purseIdTo'].toString(),
      purseIdFrom: json['purseIdFrom'].toString(),
      incomeId: json['incomeId'].toString(),
      categoryId: json['categoryId'].toString(),
      expenceId: json['expenceId'].toString(),
      suma: json['suma'] as int,
      data: json['data'].toString(),
      name: json['name'].toString(),
      description: json['description'].toString(),
    );
  }
  // ignore: prefer_constructors_over_static_methods
  static TransactionModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return TransactionModel(
        purseIdTo: map['purseIdTo'].toString(),
        purseIdFrom: map['purseIdFrom'].toString(),
        incomeId: map['incomeId'].toString(),
        categoryId: map['categoryId'].toString(),
        expenceId: map['expenceId'].toString(),
        suma: map['suma'] as int,
        data: map['data'].toString(),
        name: map['name'].toString(),
        description: map['description'].toString());
  }
}
