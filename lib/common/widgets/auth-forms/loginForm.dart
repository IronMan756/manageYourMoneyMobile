import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manageYourMoneyMobile/common/services/validators.service.dart';

import 'package:manageYourMoneyMobile/common/widgets/mYMInput/mYMInput.dart';
import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:manageYourMoneyMobile/store/store.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key key, this.title, this.height}) : super(key: key);
  final String title;
  final double height;
  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height * widget.height,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Align(
                    child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.bold),
                )),
                MYMInput(
                  icon: Icon(Icons.email),

                  obscureText: false,
                  myController: _emailController,
                  hint: 'Email',
                  validator: (String value) => validators.validateEmail(value,
                      'Email is not valid. Please input email in corect form'),
                ),
                MYMInput(
                    icon: Icon(Icons.lock),
                    obscureText: true,
                    maxLines:1,
                    myController: _passwordController,
                    hint: 'Password',
                    validator: (String value) => validators.validateSize(
                        value, 6, 'Password should be min 6 characters')),
                Center(
                    child: _button('Log In', () {
                  if (_formKey.currentState.validate()) {
                    _loginUser();
                  }
                }))
              ]),
        ));
  }

  void _loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;
    store.dispatch(LoginPending(_email, _password));
    _emailController.clear();
    _passwordController.clear();
  }

  Widget _button(String text, void Function() func) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      child: RaisedButton(
        onPressed: func,
        disabledTextColor: const Color.fromRGBO(0, 0, 0, 0.85),
        splashColor: const Color.fromRGBO(0, 0, 0, 0.4),
        color: Colors.white,
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
