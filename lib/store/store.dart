import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/store/middlewares/categories.epic.dart';
import 'package:manageYourMoneyMobile/store/middlewares/expences.epic.dart';
import 'package:manageYourMoneyMobile/store/middlewares/incomes.epic.dart';
import 'package:manageYourMoneyMobile/store/middlewares/login.epic.dart';
import 'package:manageYourMoneyMobile/store/middlewares/purses.epic.dart';
import 'package:manageYourMoneyMobile/store/middlewares/transaction.epic.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_navigator/redux_navigator.dart';

EpicMiddleware<dynamic> loginMiddleware = EpicMiddleware<dynamic>(loginEpic);
EpicMiddleware<dynamic> signupMiddleware = EpicMiddleware<dynamic>(signUpEpic);
EpicMiddleware<dynamic> getPursesMiddleware =
    EpicMiddleware<dynamic>(getPursesEpic);
EpicMiddleware<dynamic> getIncomesMiddleware =
    EpicMiddleware<dynamic>(getIncomesEpic);
EpicMiddleware<dynamic> getExpencesMiddleware =
    EpicMiddleware<dynamic>(getExpencesEpic);
EpicMiddleware<dynamic> getCategoriesMiddleware =
    EpicMiddleware<dynamic>(getCategoriesEpic);
EpicMiddleware<dynamic> getTransactionsMiddleware =
    EpicMiddleware<dynamic>(getTransactionsEpic);
EpicMiddleware<dynamic> removeExpenceMiddleware =
    EpicMiddleware<dynamic>(removeExpenceEpic);
EpicMiddleware<dynamic> removeIncomeMiddleware =
    EpicMiddleware<dynamic>(removeIncomeEpic);

EpicMiddleware<dynamic> removePurseMiddleware =
    EpicMiddleware<dynamic>(removePurseEpic);

    EpicMiddleware<dynamic> getUserMiddleware =
    EpicMiddleware<dynamic>(getUserEpic);

// EpicMiddleware <dynamic>getUserDedailsMiddleware = EpicMiddleware<dynamic>(getUserDedailsEpic);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final Store<AppState> store =
    Store<AppState>(appStateReducer, initialState: AppState(), middleware: [
  ...navigatorMiddleware<AppState>(navigatorKey),
  LoggingMiddleware<dynamic>.printer(),
  loginMiddleware,
  signupMiddleware,
  getPursesMiddleware,
  getIncomesMiddleware,
  getExpencesMiddleware,
  getCategoriesMiddleware,
  getTransactionsMiddleware,
  removeExpenceMiddleware,
  removeIncomeMiddleware,
  removePurseMiddleware,
  getUserMiddleware

  // getUserDedailsMiddleware
]);
