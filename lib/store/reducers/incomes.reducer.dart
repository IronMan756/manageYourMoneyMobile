import 'package:manageYourMoneyMobile/store/actions/incomes.action.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';

List<IncomeModel> incomesReducer(List<IncomeModel> state, dynamic action) {
  if (action is GetIncomesSuccess) {
    return action.incomes;
  }
  // if (action is LogoutSuccess) {
  //   return null;
  // }
  return state;
}
