// import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/services/purses.service.dart';
// import 'package:manageYourMoneyMobile/screens/home.dart';
import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:manageYourMoneyMobile/store/models/purse.model.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> getPursesEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is GetPursesPending)
      .switchMap((dynamic action) =>
              Stream<List<PurseModel>>.fromFuture(getPurses())
                  .map((List<PurseModel> purses) {
                return GetPursesSuccess(purses);
              })
          // .expand((List<PurseModel> purses) => <dynamic>[
          //       if (purses != null)
          //         GetPursesSuccess(purses)
          //       // PushReplacementAction(MaterialPageRoute<void>(
          //       //     builder: (BuildContext context) => const HomeScreen())
          //       //     )
          //       else
          //         null
          //     ])
          );
}
