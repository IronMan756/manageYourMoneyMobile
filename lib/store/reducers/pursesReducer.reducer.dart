import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';

import 'package:manageYourMoneyMobile/store/models/purse.model.dart';

dynamic pursesReducer(dynamic state, dynamic action) {
  if (action is GetPursesSuccess) {
    return action.purses;
  }
  // if (action is LogoutSuccess) {
  //   return null;
  // }
  return state;
}
