import 'package:flutter/material.dart';

import 'package:manageYourMoneyMobile/screens/expense.dart';
import 'package:manageYourMoneyMobile/screens/incoms.dart';
import 'package:manageYourMoneyMobile/screens/pouch.dart';

class _ViewModel {
  _ViewModel({this.isLoading});
  bool isLoading;
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    IncomsScreen(),
    PouchScreen(),
    ExpenseScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            // key: scaffoldKey,
            body:  _children[_selectedIndex]  ,
            // const Center(child: Text('HomeScreen')),
        bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            title: Text('Income'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Pouch'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_export),
            title: Text('Expense'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
    ));   
  }
    void _onItemTapped(int index) {
    setState(() {
       _selectedIndex = index;
    });
  }
}
