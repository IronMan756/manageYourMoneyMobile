
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manageYourMoneyMobile/common/services/validators.service.dart';
import 'package:manageYourMoneyMobile/common/widgets/loginForm/authInput.dart';
import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:manageYourMoneyMobile/store/store.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key key}) : super(key: key);
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
          height: 200,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AuthInput(
                  icon: Icon(Icons.email),
                  obscureText: false,
                  myController: _emailController,
                  hint: 'Email',
                  validator: (String value) => validators.validateEmail(value,
                      'Email is not valid. Please input email in corect form'),
                ),
                AuthInput(
                    icon: Icon(Icons.lock),
                    obscureText: true,
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
    return RaisedButton(
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
    );
  }
}
