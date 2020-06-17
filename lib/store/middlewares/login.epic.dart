import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/services/auth.service.dart';
import 'package:manageYourMoneyMobile/screens/auth.dart';
import 'package:manageYourMoneyMobile/screens/home.dart';
import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_navigator/redux_navigator.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> loginEpic(Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions.where((dynamic action) => action is LoginPending).switchMap(
      (dynamic action) =>
          Stream<dynamic>.fromFuture(logIn(action as LoginPending))
              .expand((dynamic token) => <dynamic>[
                    LoginSuccess(),
                    PushReplacementAction(MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const HomeScreen()))
                  ]));
}

Stream<dynamic> signUpEpic(Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions.where((dynamic action) => action is SignUpPending).switchMap(
      (dynamic action) =>
          Stream<dynamic>.fromFuture(signUp(action as SignUpPending))
              .expand((dynamic data) => <dynamic>[
                    SignUpSuccess(),
                    data != null ??
                    PushAction(MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const AuthorizationScreen()))
                  ]));
}
