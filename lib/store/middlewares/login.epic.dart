import 'package:manageYourMoneyMobile/common/services/auth.service.dart';
import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> loginEpic(Stream<dynamic> actions, EpicStore<dynamic> _store) {
  return actions.where((dynamic action) => action is LoginPending) .switchMap(
      (dynamic action) =>
          Stream<dynamic>.fromFuture(logIn(action as LoginPending)).expand(
              (dynamic token) =>
                  <dynamic>[ LoginSuccess()])
                  );
}
Stream<dynamic> signUpEpic(Stream<dynamic> actions, EpicStore<dynamic> _store) {
  print('xuy');
  return actions.where((dynamic action) => action is SignUpPending) .switchMap(
      (dynamic action) =>
          Stream<dynamic>.fromFuture(signUp(action as SignUpPending)).expand(
              (dynamic token) =>
                  <dynamic>[ SignUpSuccess()])
                  );
}