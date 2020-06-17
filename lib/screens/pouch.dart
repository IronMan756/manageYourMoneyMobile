import 'package:flutter/material.dart';

class _ViewModel {
  _ViewModel({this.isLoading});
  bool isLoading;
}

class PouchScreen extends StatefulWidget {
  const PouchScreen({Key key}) : super(key: key);

  @override
  _PouchScreenState createState() => _PouchScreenState();
}

class _PouchScreenState extends State<PouchScreen> {

  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('PouchScreen'))
    );
  }
}