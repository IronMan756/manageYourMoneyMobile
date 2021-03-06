import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/widgets/drawer/drawer.dart';
import 'package:manageYourMoneyMobile/screens/expense.dart';
import 'package:manageYourMoneyMobile/screens/incoms.dart';
import 'package:manageYourMoneyMobile/screens/purses.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    const IncomsScreen(),
    const PouchScreen(),
    const ExpenseScreen()
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Current route'),
        ),
        body: _children[_selectedIndex],
        drawer: const AppDrawer(),
        // drawerEnableOpenDragGesture: true,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.input),
              title: Text('Incomes'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text('Purses'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.import_export),
              title: Text('Expenses'),
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
