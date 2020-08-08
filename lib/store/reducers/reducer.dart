import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:manageYourMoneyMobile/store/models/category.model.dart';
import 'package:manageYourMoneyMobile/store/models/expence.model.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';
import 'package:manageYourMoneyMobile/store/models/purse.model.dart';
import 'package:manageYourMoneyMobile/store/models/transaction.model.dart';
import 'package:manageYourMoneyMobile/store/models/user.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/categories.reducer.dart';
import 'package:manageYourMoneyMobile/store/reducers/expences.reducer.dart';
import 'package:manageYourMoneyMobile/store/reducers/incomes.reducer.dart';
import 'package:manageYourMoneyMobile/store/reducers/purses.reducer.dart';
import 'package:manageYourMoneyMobile/store/reducers/transactions.reducer.dart';
import 'package:manageYourMoneyMobile/store/reducers/user.reducer.dart';

class AppState {
  AppState(
      {this.purses,
      this.incomes,
      this.expences,
      this.categories,
      this.transactions,
      this.user});

  List<PurseModel> purses;
  List<IncomeModel> incomes;
  List<ExpenceModel> expences;
  List<CategoryModel> categories;
  List<TransactionModel> transactions;
  List<UserModel> user;
}

AppState appStateReducer(AppState state, dynamic action) => AppState(
    user: userReducer(state.user, action),
    purses: pursesReducer(state.purses, action),
    incomes: incomesReducer(state.incomes, action),
    expences: expencesReducer(state.expences, action),
    categories: categoriesReducer(state.categories, action),
    transactions: transactionsReducer(state.transactions, action));
