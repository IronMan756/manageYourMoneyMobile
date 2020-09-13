import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/common/widgets/addPurseForm/addPurseForm.dart';
import 'package:manageYourMoneyMobile/common/widgets/purses/purse-item.widget.dart';
import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:manageYourMoneyMobile/store/models/purse.model.dart';
import 'package:manageYourMoneyMobile/store/models/user.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:manageYourMoneyMobile/store/store.dart';
import 'package:redux/redux.dart';

class _ViewModel {
  _ViewModel({this.isLoading, this.purses, this.user});
  bool isLoading;
  List<PurseModel> purses;
  List<UserModel> user;
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
            _ViewModel(purses: store.state.purses, user:store.state.user ),
        builder: (BuildContext context, _ViewModel state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: () => showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  // isScrollControlled: true,
                  builder: (BuildContext context) =>
                      // ignore: avoid_unnecessary_containers
                      Container(
                          height: 2000,
                          child: const Center(
                            child:
                                AddPurseForm(height: 2000, title: 'New Purse'),
                          ))),
              child: Icon(Icons.add),
              //  store.dispatch(PushAction(
              //     MaterialPageRoute<void>(
              //         builder: (BuildContext context) =>
              //             EditProfileScreen()))),
            ),
            body: ListView.builder(
                itemCount:
                    state.purses != null ? state.purses.toList().length : 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  return PurseItemWidget(
                    purse: state.purses[index],
                    purseImg:
                        'https://www.birthdaywishes.expert/wp-content/uploads/2015/10/good-morning-image-sunflower.jpg',
                  );
                }),
          );
        });
  }
}
