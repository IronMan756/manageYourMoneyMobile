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
          return Scaffold(
            floatingActionButton:
                // : state.currentUser.userId == state.user.userId
                // ?
                FloatingActionButton(
              backgroundColor: const Color.fromRGBO(251, 168, 170, 1),
              onPressed: () => showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  // isScrollControlled: true,
                  builder: (BuildContext context) =>
                      // ignore: avoid_unnecessary_containers
                      Container(
                          height: 1900,
                          child: const Center(
                            child: Text('Форма для добавления расхода'),
                          ))),
              child: Icon(Icons.add), //  store.dispatch(PushAction(
              //     MaterialPageRoute<void>(
              //         builder: (BuildContext context) =>
              //             EditProfileScreen()))),
            ),
            body:
                //    Padding(
                // padding: const EdgeInsets.all(0),
                // child:
                ListView.builder(
                    itemCount: state.expences != null
                        ? state.expences.toList().length
                        : 0,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ExpenseItemWidget(
                                expence: state.expences[index],
                              ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                            ],
                          ));
                    }),
          );
        });
  }
}
