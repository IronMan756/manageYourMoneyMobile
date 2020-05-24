import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorizationScreen extends StatefulWidget {
  AuthorizationScreen({Key key}) : super(key: key);

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cpasswordController = TextEditingController();
  TextEditingController _loginController = TextEditingController();

  String _email;
  String _password;
  String _cpassword;
  String _login;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _logo(String logo) {
      return  Padding(
          padding: EdgeInsets.only(top: 50, bottom: 20),
          child: Container(
            child: Align(
                child: Text(
              logo,
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            )),
          ));
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
              controller: controller,
              obscureText: obscure,
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black38),
                  hintText: hint,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.01),
                  ),
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: IconTheme(
                          data: IconThemeData(
                            color: Color.fromRGBO(0, 0, 0, 0.85),
                          ),
                          child: icon)))));
    }

    Widget _button(String text, void func()) {
      return RaisedButton(
        onPressed: func,
        disabledTextColor: Color.fromRGBO(0, 0, 0, 0.85),
        splashColor: Color.fromRGBO(0, 0, 0, 0.4),
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
    }

    Widget _logInForm(String label, void func()) {
      return Container(
          child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: _input(Icon(Icons.email), 'Email', _emailController, false)),
        Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(
                Icon(Icons.lock), 'Password', _passwordController, true)),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func))),
        Padding(
            padding: EdgeInsets.only(top: 50),
            child: GestureDetector(
              child: Text(
                'Dont have an account? Sign up !',
                style: TextStyle(
                  fontSize: 15,color: Colors.blue
                ),
              ), 
              onTap : (){
                setState((){
                    showLogin = false;
                  });
              }
            )
        )
      ]));
    };

    Widget _signUpForm(String label, void func()) {
      return Container(
          child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: _input(Icon(Icons.person ), 'Login', _loginController, false)),
        Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(Icon(Icons.email), 'Email', _emailController, false)),
        Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(
                Icon(Icons.lock), 'Password', _passwordController, true)),
        Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(
                Icon(Icons.lock), 'Confirm password', _cpasswordController, true)),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label, func))),
        Padding(
            padding: EdgeInsets.only(top: 50),
            child: GestureDetector(
              child: Text(
                'Already have an account? Sign in !',
                style: TextStyle(
                  fontSize: 15,color: Colors.blue
                ),
              ), 
              onTap : (){
                setState((){
                    showLogin = true;
                  });
              }
            )
        )        
      ]));
    }




    void _loginUser() {
      _email = _emailController.text;
      _password = _passwordController.text;
      print( _email );
      print(_password);

      _emailController.clear();
      _passwordController.clear();
    }

    void _signUpUser() {
      _login = _loginController.text;
      _email = _emailController.text;
      _password = _passwordController.text;
      _cpassword = _cpasswordController.text;

      print(_login);
      print(_email);
      print(_password);
      print(_cpassword);
      

      _emailController.clear();
      _loginController.clear();
      _passwordController.clear();
      _cpasswordController.clear();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: 
        
        showLogin ? 
        ListView(
          children: <Widget>[
              SizedBox(
                height: 100,
              ),
              _logo('Sign in to continue'),
              _logInForm('Log In', _loginUser) 
          ]
        )
        :
        ListView(
          children: <Widget>[
            _logo('Sign up to continue'),
            _signUpForm('Sign Up', _signUpUser)
        ]
        )));
  }}