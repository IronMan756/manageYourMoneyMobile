import 'package:manageYourMoneyMobile/store/actions/expences.action.dart';
import 'package:manageYourMoneyMobile/store/models/expence.model.dart';

List<ExpenceModel> expencesReducer(List<ExpenceModel> state, dynamic action) {
  if (action is GetExpencesSuccess) {
    return action.expences;
  }
  // if (action is LogoutSuccess) {
  //   return null;
  // }
  return state;
}
