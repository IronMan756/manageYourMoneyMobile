import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:manageYourMoneyMobile/store/models/purse.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/pursesReducer.reducer.dart';

class AppState {
  AppState({this.purses});

  List<PurseModel> purses;
}

AppState appStateReducer(AppState state, dynamic action) => AppState(
    // user: userReduser(state.user,action),
    purses: pursesReducer(state.purses, action));
