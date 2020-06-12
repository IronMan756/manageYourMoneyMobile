
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key key}) : super(key: key);
  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<LogInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller:_controller,
                validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              }),
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print('It is valid date ${_controller.text}');
                        }
                      },
                      child: const Text('Submit')))
            ]));
  }
}
