import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/common/widgets/mYMInput/mYMInput.dart';
import 'package:manageYourMoneyMobile/store/actions/purses.action.dart';
import 'package:manageYourMoneyMobile/store/models/user.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:manageYourMoneyMobile/store/store.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _ViewModel {
  _ViewModel({this.isLoading, this.user});
  bool isLoading;
  List<UserModel> user;
}

class AddPurseForm extends StatefulWidget {
  const AddPurseForm({Key key, this.title, this.height}) : super(key: key);
  final String title;
  final double height;
  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<AddPurseForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _purseNameController = TextEditingController();
  final TextEditingController _balanseController = TextEditingController();
  String _name;
  String _balance;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) =>
            _ViewModel(user: store.state.user),
        builder: (BuildContext context, _ViewModel state) {
          return Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height * widget.height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Align(
                          child: Text(
                        "New Purse",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                      MYMInput(
                        icon: Icon(Icons.business_center),
                        obscureText: false,
                        myController: _purseNameController,
                        hint: 'Name',
                        // validator: (String value) => validators.validateEmail(value,
                        //     'Email is not valid. Please input email in corect form'),
                      ),
                      MYMInput(
                        icon: Icon(Icons.account_balance_wallet),
                        obscureText: true,
                        myController: _balanseController,
                        hint: 'Balance',
                        // validator: (String value) => validators.validateSize(
                        //     value, 6, 'Password should be min 6 characters')
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: _button('Add', () {
                                if (_formKey.currentState.validate()) {
                                  _loginUser(state.user);
                                }
                              }, 0.35, const Color.fromRGBO(191, 253, 225, 1)),
                            ),
                            Container(
                              child: _button('Cancel', () {}, 0.35,
                                  const Color.fromRGBO(251, 168, 170, 1)),
                            ),
                          ])
                    ]),
              ));
        });
  }

  void _loginUser(dynamic user) async {
    _name = _purseNameController.text;
    _balance = _balanseController.text;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Xuy ${user}');
    // final String token = prefs.getString('access_token');
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    // print(decodedToken['phone']);
    // store.dispatch(CreatePursePending('', _name, _balance, ''));
    _purseNameController.clear();
    _balanseController.clear();
  }

  Widget _button(String text, void Function() func, num width, Color color) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      height: 50,
      child: RaisedButton(
        onPressed: func,
        disabledTextColor: const Color.fromRGBO(0, 0, 0, 0.85),
        splashColor: const Color.fromRGBO(0, 0, 0, 0.4),
        color: color,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
