import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/store/models/expence.model.dart';

class GetExpencesPending {}

class GetExpencesSuccess {
  GetExpencesSuccess(this.expences);
  List<ExpenceModel> expences;
}

class Expence {
  Expence(this.userId, this.purseId, this.suma, this.data, this.name,
      this.description);
  String userId;
  String purseId;
  int suma;
  DataCell data;
  String name;
  String description;
}

class GetExpencesError {}

class CreateExpencePending {
  CreateExpencePending(this.userId, this.purseId, this.suma, this.data,
      this.name, this.description);
  String userId;
  String purseId;
  int suma;
  DataCell data;
  String name;
  String description;
}
