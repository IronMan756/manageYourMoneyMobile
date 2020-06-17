import 'package:flutter/material.dart';

class _ViewModel {
  _ViewModel({this.isLoading});
  bool isLoading;
}

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key key}) : super(key: key);

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {

  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ExpenseScreen'))
    );
  }
}