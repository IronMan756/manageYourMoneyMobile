import 'package:manageYourMoneyMobile/common/services/transactions.service.dart';
import 'package:manageYourMoneyMobile/store/actions/transactions.action.dart';
import 'package:manageYourMoneyMobile/store/models/transaction.model.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> getTransactionsEpic(
    Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions
      .where((dynamic action) => action is GetTransactionsPending)
      .switchMap((dynamic action) =>
          Stream<List<TransactionModel>>.fromFuture(getTransactions())
              .map((List<TransactionModel> transactions) {
            return GetTransactionsSuccess(transactions);
          }));
}
