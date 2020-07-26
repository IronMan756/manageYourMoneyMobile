import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:manageYourMoneyMobile/store/models/expence.model.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';
import 'package:manageYourMoneyMobile/store/models/purse.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/expences.reducer.dart';
import 'package:manageYourMoneyMobile/store/reducers/incomes.reducer.dart';
import 'package:manageYourMoneyMobile/store/reducers/purses.reducer.dart';

class AppState {
  AppState({this.purses, this.incomes, this.expences});

  List<PurseModel> purses;
  List<IncomeModel> incomes;
  List<ExpenceModel> expences;
}

AppState appStateReducer(AppState state, dynamic action) => AppState(
    // user: userReduser(state.user,action),
    purses: pursesReducer(state.purses, action),
    incomes: incomesReducer(state.incomes, action),
    expences: expencesReducer(state.expences, action));
