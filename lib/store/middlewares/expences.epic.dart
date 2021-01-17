import 'package:manageYourMoneyMobile/common/services/expence.service.dart';
import 'package:manageYourMoneyMobile/store/actions/expences.action.dart';
import 'package:manageYourMoneyMobile/store/models/expence.model.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:rxdart/rxdart.dart';

Stream<dynamic> getExpencesEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is GetExpencesPending)
      .switchMap((dynamic action) =>
          Stream<List<ExpenceModel>>.fromFuture(getExpences())
              .map((List<ExpenceModel> expences) {
            return GetExpencesSuccess(expences);
          }));
}

Stream<dynamic> removeExpenceEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is RemoveExpencePending)
      .switchMap((dynamic action) =>
          Stream<dynamic>.fromFuture(removeExpence(action)).map((data) {
            if (data == false) RemoveExpenceError(data);
            return GetExpencesPending();
          }).doOnError((dynamic error) => RemoveExpenceError(error)));
}

Stream<dynamic> createExpenceEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is CreateExpencePending)
      .switchMap((dynamic action) =>
          Stream<dynamic>.fromFuture(createExpence(action as CreateExpencePending)).map((data) {
            // print(data);
            if (data == false) CreateExpenceError();
            return GetExpencesPending();
          }).doOnError((dynamic error) => RemoveExpenceError(error)));
}