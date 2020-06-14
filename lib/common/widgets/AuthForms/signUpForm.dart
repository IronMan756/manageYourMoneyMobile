import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:manageYourMoneyMobile/common/widgets/AuthForms/authInput.dart';
import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:manageYourMoneyMobile/store/store.dart';

import '../../services/validators.service.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key key, this.height, this.title}) : super(key: key);
  final double height;
  final String title;
  @override
  SignUpFormState createState() {
    return SignUpFormState();
  }
}

class SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  String _email;
  String _login;
  String _password;
  String _cpassword;
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
                  AuthInput(
                    icon: Icon(Icons.person),
                    myController: _loginController,
                    obscureText: false,
                    hint: 'Login',
                    validator: (String value) => validators.validateIsEmpty(value, 'Please enter login')
                  ),
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
                  AuthInput(
                      icon: Icon(Icons.lock),
                      obscureText: true,
                      myController: _cpasswordController,
                      hint: 'Password',
                      validator: (String value) => validators.compareValidate(value, _passwordController, 'Both passwords should be equal')
                          ),
                  Center(
                      child: _button('Sign up', () {
                    if (_formKey.currentState.validate() ) {
                      _signUpUser();
                    }
                  }))
                ])));
  }

  void _signUpUser() {
    _login = _loginController.text;
    _email = _emailController.text;
    _password = _passwordController.text;
    _cpassword = _cpasswordController.text;
    store.dispatch(SignUpPending(_login, _email, _cpassword));
    _emailController.clear();
    _loginController.clear();
    _passwordController.clear();
    _cpasswordController.clear();
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
