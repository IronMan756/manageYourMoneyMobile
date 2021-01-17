import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/services/auth.service.dart';
import 'package:manageYourMoneyMobile/screens/home.dart';
import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:manageYourMoneyMobile/store/models/user.model.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_navigator/redux_navigator.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> loginEpic(Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions.where((dynamic action) => action is LoginPending).switchMap(
      (dynamic action) =>
          Stream<dynamic>.fromFuture(logIn(action as LoginPending))
          // ignore: missing_return
          .map( (dynamic token){
            if(token != null){
              return LoginSuccess(token.toString());}
            // return Error;
          } )
              // .expand((String token) =>List<String>[
              //       LoginSuccess(token),
              //       // if (user != null)
              //       PushReplacementAction(MaterialPageRoute<void>(
              //           builder: (BuildContext context) => const HomeScreen()))
              //       // else
              //       //   null
              //     ])
                  );
}
// To Do servise to get user and redirect to home screen
Stream<dynamic> getUserEpic(Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions.where((dynamic action) => action is LoginSuccess).switchMap(
      (_) =>
          Stream<dynamic>.fromFuture(checkUser())
              .expand(( user) => <dynamic>[
            GetUserSuccess(user as List<UserModel>),
           
            if (user != null)
            PushReplacementAction(MaterialPageRoute<void>(
                builder: (BuildContext context) => const HomeScreen()))
            else
              null
          ])
          );
}

Stream<dynamic> signUpEpic(Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions.where((dynamic action) => action is SignUpPending).switchMap(
      (dynamic action) =>
          Stream<dynamic>.fromFuture(signUp(action as SignUpPending))
              .expand((dynamic data) => <dynamic>[
                    SignUpSuccess(),
                //        PushReplacementAction(MaterialPageRoute<void>(
                // builder: (BuildContext context) => const HomeScreen()))
                  ]));
}
