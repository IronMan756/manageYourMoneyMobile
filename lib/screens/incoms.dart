import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/common/widgets/incomes/income-item.widget.dart';
import 'package:manageYourMoneyMobile/screens/purses.dart';
import 'package:manageYourMoneyMobile/store/actions/incomes.action.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:manageYourMoneyMobile/store/store.dart';
import 'package:redux/redux.dart';

class _ViewModel {
  _ViewModel({this.isLoading, this.incomes});
  bool isLoading;
  List<IncomeModel> incomes;
}

class IncomsScreen extends StatefulWidget {
  const IncomsScreen({Key key}) : super(key: key);

  @override
  _IncomsScreenState createState() => _IncomsScreenState();
}

class _IncomsScreenState extends State<IncomsScreen> {
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    store.dispatch(GetIncomesPending());
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) =>
            _ViewModel(incomes: store.state.incomes),
        builder: (BuildContext context, _ViewModel state) {
          return Scaffold(
            floatingActionButton:
                // : state.currentUser.userId == state.user.userId
                // ?
                FloatingActionButton(
              backgroundColor: const Color.fromRGBO(191, 253, 225, 1),
              onPressed: () => {
                showModalBottomSheet(
                    context: context,
                    useRootNavigator: true,
                    // isScrollControlled: true,
                    builder: (BuildContext context) =>
                        // ignore: avoid_unnecessary_containers
                        Container(
                            height: 1900,
                            child: Center(
                              child: const Text(
                                  'Форма для добавления поступления'),
                            ))),
              },
              child: Icon(Icons.add,
                  color: Colors.black), //  store.dispatch(PushAction(
              //     MaterialPageRoute<void>(
              //         builder: (BuildContext context) =>
              //             EditProfileScreen()))),
            ),
            body:
                //    Padding(
                // padding: const EdgeInsets.all(8.0),
                // child:
                ListView.builder(
                    itemCount: state.incomes != null
                        ? state.incomes.toList().length
                        : 0,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IncomeItemWidget(income: state.incomes[index]),
                            ],
                          ));
                    }),
          );
        });
  }
}
