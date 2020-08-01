import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:manageYourMoneyMobile/store/models/purse.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:manageYourMoneyMobile/store/store.dart';
import 'package:redux/redux.dart';

class _ViewModel {
  _ViewModel({this.isLoading, this.purses});
  bool isLoading;
  List<PurseModel> purses;
}

class PouchScreen extends StatefulWidget {
  const PouchScreen({Key key}) : super(key: key);

  @override
  _PouchScreenState createState() => _PouchScreenState();
}

dynamic _onPress() async {
  store.dispatch(GetPursesPending());
}

class _PouchScreenState extends State<PouchScreen> {
  // bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    _onPress();
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) =>
            _ViewModel(purses: store.state.purses),
        builder: (BuildContext context, _ViewModel state) {
          print(store.state.purses);
          return Scaffold(
            body: ListView.builder(
                itemCount:
                    state.purses != null ? state.purses.toList().length : 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: FittedBox(
                                    child: Material(
                                        elevation: 25.0,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              height: 100,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: const Image(
                                                      // fit: BoxFit.contain,
                                                      // alignment:
                                                      //     Alignment.topLeft,
                                                      image: NetworkImage(
                                                          'https://www.birthdaywishes.expert/wp-content/uploads/2015/10/good-morning-image-sunflower.jpg'))),
                                            ),
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8, top: 0),
                                                      child: Text(
                                                          state.purses[index]
                                                              .name
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Text(
                                                            'Available: ${state.purses[index].balance.toString()} grn')),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Text('adsouvh')),
                                                  ],
                                                )),
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.35,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                top: 0),
                                                        child: Row(children: <
                                                            Widget>[
                                                          const Text('Bal:'),
                                                          Text(
                                                            state.purses[index]
                                                                .balance
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 16),
                                                          ),
                                                          const Text('grn',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10)),
                                                        ])),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Text(
                                                            'Available: 400€')),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        child: Text('adsouvh')),
                                                  ],
                                                )),
                                          ],
                                        ))),
                              ),
                            ],
                          )
                        ],
                      ));
                }),
          );
        });
  }
}
