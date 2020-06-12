import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/screens/auth.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:manageYourMoneyMobile/store/store.dart';
import 'package:redux/redux.dart';




void main() => runApp(MyApp(
  store: store
));
class MyApp extends StatefulWidget {
  const MyApp({Key key, this.store}) : super(key: key);
  final Store <AppState> store;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations(< DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manage Your Money',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          title: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.85))         
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AuthorizationScreen(),
    ));
  }
}
