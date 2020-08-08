import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:manageYourMoneyMobile/store/models/user.model.dart';

List<UserModel> userReducer(List<UserModel> state, dynamic action) {
  if (action is LoginSuccess) {
    return action.user;
  }
  // if (action is LogoutSuccess) {
  //   return null;
  // }
  return state;
}
