import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/screens/auth.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:manageYourMoneyMobile/store/store.dart';
import 'package:redux/redux.dart';

void main() => runApp(MyApp(store: store));

class MyApp extends StatefulWidget {
  const MyApp({Key key, this.store}) : super(key: key);
  final Store<AppState> store;

   static void setLocale(BuildContext context, Locale locale){
    final _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale); 
  }
  
  @override
  _MyAppState createState() => _MyAppState();
}
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _MyAppState extends State<MyApp> {

  Locale _locale;

  void setLocale (Locale locale){
    setState((){
      _locale = locale;
    }); 
  }
  
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
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
                title: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.85))),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          navigatorKey: navigatorKey,
          home: const AuthorizationScreen(),
        ));
  }
}
