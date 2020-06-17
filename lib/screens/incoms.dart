import 'package:flutter/material.dart';

class _ViewModel {
  _ViewModel({this.isLoading});
  bool isLoading;
}

class IncomsScreen extends StatefulWidget {
  const IncomsScreen({Key key}) : super(key: key);

  @override
  _IncomsScreenState createState() => _IncomsScreenState();
}

class _IncomsScreenState extends State<IncomsScreen> {

  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('IncomsScreen'))
    );
  }
}