import 'package:flutter/material.dart';

class IncomeModel {
  IncomeModel(
      {this.userId,
      this.purseId,
      this.suma,
      this.data,
      this.name,
      this.description});
  final String userId;
  final String purseId;
  final int suma;
  final DataCell data;
  final String name;
  final String description;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'userId': userId,
      'purseId': purseId,
      'suma': suma,
      'data': data,
      'name': name,
      'description': description
    };
  }

  // ignore: sort_constructors_first
  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      userId: json['userId'].toString(),
      purseId: json['purseId'].toString(),
      data: json['data'] as DataCell,
      suma: json['suma'] as int,
      name: json['name'].toString(),
      description: json['description'].toString(),
    );
  }
  // ignore: prefer_constructors_over_static_methods
  static IncomeModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return IncomeModel(
        userId: map['userId'].toString(),
        purseId: map['purseId'].toString(),
        data: map['data'] as DataCell,
        suma: map['suma'] as int,
        name: map['name'].toString(),
        description: map['description'].toString());
  }
}
