import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/store/models/transaction.model.dart';

class GetTransactionsPending {}

class GetTransactionsSuccess {
  GetTransactionsSuccess(this.transactions);
  List<TransactionModel> transactions;
}

class Transaction {
  Transaction(
      this.userId,
      this.purseIdTo,
      this.purseIdFrom,
      this.incomeId,
      this.expenceId,
      this.suma,
      this.data,
      this.name,
      this.description,
      this.categoryId);
  String userId;
  String purseIdTo;
  String purseIdFrom;
  String incomeId;
  String expenceId;
  int suma;
  DataCell data;
  String name;
  String description;
  String categoryId;
}

class GetTransactionError {}

class CreateTransactionPending {
  CreateTransactionPending(this.name, this.description, this.img);
  String name;
  String description;
  String img;
}
