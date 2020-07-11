// import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/services/purses.service.dart';
// import 'package:manageYourMoneyMobile/screens/home.dart';
import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:redux_epics/redux_epics.dart';
// import 'package:redux_navigator/redux_navigator.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> getPursesEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is GetPursesPending)
      .switchMap((dynamic action) => Stream<dynamic>.fromFuture(getPurses())
          .expand((dynamic purses) => <dynamic>[
                if (purses != null)
                  GetPursesSuccess(purses)
                // PushReplacementAction(MaterialPageRoute<void>(
                //     builder: (BuildContext context) => const HomeScreen())
                //     )
                else
                  null
              ]));
}
