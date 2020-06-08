import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/store/middlewares/login.epic.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_navigator/redux_navigator.dart';


EpicMiddleware <dynamic>loginMiddleware = EpicMiddleware<dynamic>(loginEpic);
EpicMiddleware <dynamic>signupMiddleware = EpicMiddleware<dynamic>(signUpEpic);
// EpicMiddleware <dynamic>getUserDedailsMiddleware = EpicMiddleware<dynamic>(getUserDedailsEpic);
 final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final Store<AppState> store = Store<AppState>(appStateReducer,
    initialState: AppState(
     
    ),
    middleware: [
       ...navigatorMiddleware<AppState>(navigatorKey),
      LoggingMiddleware<dynamic>.printer(),
      loginMiddleware,
      signupMiddleware
      // getUserDedailsMiddleware

    ]);
