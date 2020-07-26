import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';

class GetIncomesPending {}

class GetIncomesSuccess {
  GetIncomesSuccess(this.incomes);
  List<IncomeModel> incomes;
}

class Income {
  Income(this.userId, this.purseId, this.suma, this.data, this.name,
      this.description);
  String userId;
  String purseId;
  int suma;
  DataCell data;
  String name;
  String description;
}

class GetIncomesError {}

class CreateIncomePending {
  CreateIncomePending(this.userId, this.purseId, this.suma, this.data,
      this.name, this.description);
  String userId;
  String purseId;
  int suma;
  DataCell data;
  String name;
  String description;
}
