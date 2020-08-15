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
              body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: state.purses.toList().length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(state.purses[index].name.toString()),
                              const Text(':'),
                              Text(state.purses[index].balance.toString())
                            ],
                          )
                        ],
                      ));
                }),
          ));
        });
  }
}
