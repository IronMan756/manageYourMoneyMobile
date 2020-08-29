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
          }));
}

Stream<dynamic> removePurseEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is RemovePursePending)
      .switchMap((dynamic action) =>
          Stream<dynamic>.fromFuture(removePurse(action)).map((dynamic data) {
            if (data == false) RemovePurseError(data);
            return GetPursesPending();
          }).doOnError((dynamic error) => RemovePurseError(error)));
}

Stream<dynamic> createPurseEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is CreatePursePending)
      .switchMap(( action) =>
          Stream<dynamic>.fromFuture(createPurse(action)).map((dynamic data) {
            if (data == false) RemovePurseError(data);
            return GetPursesPending();
          }).doOnError((dynamic error) => RemovePurseError(error)));
}
