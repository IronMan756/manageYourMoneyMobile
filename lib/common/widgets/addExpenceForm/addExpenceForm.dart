
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manageYourMoneyMobile/common/services/validators.service.dart';
import 'package:manageYourMoneyMobile/common/widgets/mYMInput/mYMInput.dart';
import 'package:manageYourMoneyMobile/store/actions/expences.action.dart';
import 'package:manageYourMoneyMobile/store/models/purse.model.dart';
import 'package:manageYourMoneyMobile/store/models/user.model.dart';
import 'package:manageYourMoneyMobile/store/reducers/reducer.dart';
import 'package:manageYourMoneyMobile/store/store.dart';
import 'package:redux/redux.dart';
import 'package:intl/intl.dart';

class _ViewModel {
  _ViewModel({this.isLoading, this.user, this.purses});
  bool isLoading;
  List<UserModel> user;
  List<PurseModel> purses;
}

class AddExpenceForm extends StatefulWidget {
  const AddExpenceForm({Key key, this.title, this.height}) : super(key: key);
  final String title;
  final double height;
  @override
 AddExpenceFormState createState() {
    return AddExpenceFormState();
  }
}

class AddExpenceFormState extends State<AddExpenceForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _purseNameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
   final TextEditingController _descriptionController = TextEditingController();

  String _name;
  String _amount;
  String _purseId;
  int _date;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) =>
            _ViewModel(
              user: store.state.user, 
              purses: store.state.purses),
        builder: (BuildContext context, _ViewModel state) {
          return Form(
              key: _formKey,
              // ignore: avoid_unnecessary_containers
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 15,),
                    const Align(
                        child: Text(
                      'New Expence',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                     const SizedBox(height: 20,),
                    MYMInput(
                      icon: Icon(Icons.account_balance_wallet ),
                      maxLines: 1,
                      obscureText: false,
                      myController: _purseNameController,
                      hint: 'Name',
                      validator: (String value) => validators.validateSize(value,1,
                          'Field is not valid. Please input value longer than 1 character'),
                    ),
                    const SizedBox(height: 10,),
                     MYMInput(
                      icon: Icon(Icons.list
                      ),
                      maxLines: 1,
                      obscureText: false,
                      myController: _amountController,
                      hint: 'Chouse Purse',
                    validator: (String value) =>  validators.validateSize(value,1,
                          'Amount is not valid. Please input value longer than 1 character'),
                    ),
                         const SizedBox(height: 10,),
                    MYMInput(
                      icon: Icon(Icons.account_balance
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      myController: _amountController,
                      hint: 'Amount',
                    validator: (String value) =>  validators.validateSize(value,1,
                          'Amount is not valid. Please input value longer than 1 character'),
                    ),
                    const SizedBox(height: 10,),
                    MYMInput(
                      icon: const Icon(null),
                      maxLines: 2,
                      obscureText: false,
                      myController: _descriptionController,
                      hint: 'Description',
                    validator: (String value) =>  validators.validateSize(value,1,
                          'Description is not valid. Please input value longer than 1 character'),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: _button('Add', () {
                              if (_formKey.currentState.validate()) {
                                _createExpense(store.state.user);
                                Navigator.pop(context);
                              }
                            }, 0.35, const Color.fromRGBO(191, 253, 225, 1)),
                          ),
                          Container(
                            child: _button('Cancel',() => Navigator.pop(context), 0.35,
                                const Color.fromRGBO(251, 168, 170, 1)),
                          ),
                        ]),
                        const SizedBox(height: 30),
                  ],
                ),
              ));
        });
  }

  void _createExpense(List<UserModel> user) async {
    _name = _purseNameController.text;
    _amount = _amountController.text;
    // print(user[0].id.toString());
    // print(_purseId);
    // print(_amount);
     _date =  DateTime.now().millisecondsSinceEpoch;
    print(_date);
    store.dispatch(CreateExpencePending(user[0].id.toString(),_purseId,_amount,_date, _name,  ''));
    _purseNameController.clear();
    _amountController.clear();
    
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
