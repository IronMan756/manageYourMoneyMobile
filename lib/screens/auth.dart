import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/common/widgets/AuthForms/loginForm.dart';
import 'package:manageYourMoneyMobile/common/widgets/AuthForms/signUpForm.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:redux/redux.dart';

class _ViewModel {
  _ViewModel({this.isLoading});
  bool isLoading;
}

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key key}) : super(key: key);

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {

  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) => _ViewModel(),
        builder: (BuildContext context, _ViewModel state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                  child: showLogin
                      ? ListView(
                        children: <Widget>[
                          const SizedBox(
                            height: 110,
                          ),
                          const LogInForm(title:'Sign in to continue', height: 0.55),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                 vertical: 50
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showLogin = false;
                                    });
                                  },
                                  child: const Text(
                                    'Dont have an account? Sign up !',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                  ),
                                ),
                              ))
                        ])
                      : ListView(children: <Widget>[
                          const SizedBox(
                            height: 50,
                          ),
                          const SignUpForm(title:'Sign up to continue', height: 0.8),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                 vertical: 20
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showLogin = true;
                                    });
                                  },
                                  child: const Text(
                                    'Already have an account? Sign in !',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.blue),
                                  ),
                                ),
                              ))
                        ])));
        });
  }
}
