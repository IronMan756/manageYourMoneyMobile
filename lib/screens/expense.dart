import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/common/widgets/expences/expense-item.widget.dart';
import 'package:manageYourMoneyMobile/store/actions/expences.action.dart';
import 'package:manageYourMoneyMobile/store/models/expence.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:manageYourMoneyMobile/store/store.dart';
import 'package:redux/redux.dart';

class _ViewModel {
  _ViewModel({this.isLoading, this.expences});
  bool isLoading;
  List<ExpenceModel> expences;
}

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key key}) : super(key: key);

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    store.dispatch(GetExpencesPending());
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) =>
            _ViewModel(expences: store.state.expences),
        builder: (BuildContext context, _ViewModel state) {
          // print(
          //     '${state.expences[2].date.toString().substring(5, 7)} ${state.expences[2].date.toString().substring(8, 10)} ${state.expences[2].date.toString().substring(0, 4)}');
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount:
                    state.expences != null ? state.expences.toList().length : 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                      margin: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ExpenseItemWidget(
                              expence: state.expences[index],
                              expenseName: state.expences[index].name,
                              balance: state.expences[index].suma,
                              // expenseDate: state.expences[index].date,
                              description: state.expences[index].description),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ));
                }),
          ));
        });
  }
}
