import 'package:manageYourMoneyMobile/common/services/incomes.service.dart';
import 'package:manageYourMoneyMobile/store/actions/incomes.action.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';
import 'package:redux_epics/redux_epics.dart';

import 'package:rxdart/rxdart.dart';

Stream<dynamic> getIncomesEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is GetIncomesPending)
      .switchMap((dynamic action) =>
          Stream<List<IncomeModel>>.fromFuture(getIncomes())
              .map((List<IncomeModel> incomes) {
            return GetIncomesSuccess(incomes);
          }));
}

Stream<dynamic> removeIncomeEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is RemoveIncomePending)
      .switchMap((dynamic action) =>
          Stream<dynamic>.fromFuture(removeIncome(action)).map((data) {

            if (data == false) RemoveIncomeError(data);
            return GetIncomesPending();
          }).doOnError((dynamic error) => RemoveIncomeError(error)));
}


