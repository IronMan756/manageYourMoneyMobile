import 'package:manageYourMoneyMobile/store/actions/transactions.action.dart';
import 'package:manageYourMoneyMobile/store/models/transaction.model.dart';

List<TransactionModel> transactionsReducer(
    List<TransactionModel> state, dynamic action) {
  if (action is GetTransactionsSuccess) {
    return action.transactions;
  }
  return state;
}
