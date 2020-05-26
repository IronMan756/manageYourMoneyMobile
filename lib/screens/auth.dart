import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key key}) : super(key: key);

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();

  String _email;
  String _password;
  String _cpassword;
  String _login;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _logo(String logo) {
      return  Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Align(
              child: Text(
            logo,
            style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          )));
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
          padding: const EdgeInsets.only(left: 20, right: 20,),
          child: TextField(
              controller: controller,
              obscureText: obscure,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black38),
                  hintText: hint,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.01),
                  ),
                  prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: IconTheme(
                          data: const IconThemeData(
                            color:  Color.fromRGBO(0, 0, 0, 0.85),
                          ),
                          child: icon)))));
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

    Widget _logInForm(String label, void Function() func) {
      return Column(children: <Widget>[
        Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: _input(const Icon(Icons.email), 'Email', _emailController, false)),
        Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: _input(
            const Icon(Icons.lock), 'Password', _passwordController, true)),
        const SizedBox(height: 20),
        Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: _button(label, func))),
        Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GestureDetector(
            onTap : (){
            setState((){
                showLogin = false;
              });
          },
           child: const Text(
            'Dont have an account? Sign up !',
            style: TextStyle(
              fontSize: 15,color: Colors.blue
            ),
          ), 
        
        )
        )
      ]);
    };

    Widget _signUpForm(String label, void Function() func) {
      return Column(children: <Widget>[
        Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: _input(const Icon(Icons.person ), 'Login', _loginController, false)),
        Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: _input(const Icon(Icons.email), 'Email', _emailController, false)),
        Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: _input(
            const Icon(Icons.lock), 'Password', _passwordController, true)),
        Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: _input(
            const Icon(Icons.lock), 'Confirm password', _cpasswordController, true)),
        const SizedBox(height: 20),
        Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: _button(label, func))),
        Padding(
        padding: const EdgeInsets.only(top: 50),
        child: GestureDetector(
           onTap : (){
            setState((){
                showLogin = true;
              });
          },
          child: const Text(
            'Already have an account? Sign in !',
          style: TextStyle(
              fontSize: 15,color: Colors.blue
            ),
          ), 
         
        )
        )        
      ]);
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
              const SizedBox(
                height: 100,
              ),
              _logo('Sign in to continue'),
              _logInForm('Log In', _loginUser) 
          ]
        )
        :
        ListView(
          children: <Widget>[
             const SizedBox(
                height: 65,
              ),
            _logo('Sign up to continue'),
            _signUpForm('Sign Up', _signUpUser)
        ]
        )));
  }}