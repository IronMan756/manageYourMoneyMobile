import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _Toaster toaster = _Toaster();

class _Toaster {
  void show({@required String message, @required Color color}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      textColor: Colors.black,
      backgroundColor: color,
      timeInSecForIos: 5,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
