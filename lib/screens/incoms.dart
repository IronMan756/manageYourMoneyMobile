import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/store/actions/categories.action.dart';
import 'package:manageYourMoneyMobile/store/actions/incomes.action.dart';
import 'package:manageYourMoneyMobile/store/actions/transactions.action.dart';
import 'package:manageYourMoneyMobile/store/models/category.model.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';
import 'package:manageYourMoneyMobile/store/models/transaction.model.dart';
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
              body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount:
                    state.incomes != null ? state.incomes.toList().length : 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: FittedBox(
                                child: Material(
                                    elevation: 25.0,
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          height: 100,
                                          // width: MediaQuery.of(context)
                                          //         .size
                                          //         .width *
                                          //     0.27,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: const Image(
                                                  fit: BoxFit.contain,
                                                  // alignment: Alignment.topLeft,
                                                  image: NetworkImage(
                                                      'https://www.birthdaywishes.expert/wp-content/uploads/2015/10/good-morning-image-sunflower.jpg'))),
                                        ),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.37,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                // Text('Income Name',
                                                //     style: TextStyle(
                                                //         fontSize: 20)),
                                                // Text(
                                                //     state.incomes[index]
                                                //         .name
                                                //         .toString(),
                                                //     style: TextStyle(
                                                //         fontSize: 20,
                                                //         fontWeight:
                                                //             FontWeight
                                                //                 .bold)),
                                                // const Padding(
                                                //     padding:
                                                //         EdgeInsets.all(
                                                //             5),
                                                //     child:
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, top: 0),
                                                  child: Text(
                                                      state.incomes[index].name
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                        'Available: 400€')),
                                                const Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text('adsouvh')),
                                                // const Padding(
                                                //     padding: EdgeInsets.all(5)),
                                                // Text('Text3')),
                                              ],
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.37,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.only(
                                                //           left: 8, top: 0),
                                                //   child:
                                                Text(
                                                  state.incomes[index].name
                                                      .toString(),
                                                ),

                                                const Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text(
                                                        'Available: 400€')),
                                                const Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Text('adsouvh')),
                                                // const Padding(
                                                //     padding: EdgeInsets.all(5)),
                                                // Text('Text3')),
                                              ],
                                            )),
                                      ],
                                    ))),
                          ),
                          // ),

                          // Text(state.incomes[index].balance.toString())
                          // ],
                          // ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(state.incomes[index].name.toString()),
                          // Text(':'),
                        ],
                      ));
                }),
          ));
        });
  }
}
