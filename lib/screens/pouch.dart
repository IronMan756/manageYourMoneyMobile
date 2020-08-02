import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/common/widgets/pockets/pocket-item.widget.dart';
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
          return Scaffold(
            body: ListView.builder(
                itemCount:
                    state.purses != null ? state.purses.toList().length : 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  return PocketItemWidget(
                      balance: state.purses[index].balance,
                      purseImg:
                          'https://www.birthdaywishes.expert/wp-content/uploads/2015/10/good-morning-image-sunflower.jpg',
                      purseName: state.purses[index].name.toString());
                }),
          );
        });
  }
}
