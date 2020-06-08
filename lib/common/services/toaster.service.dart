import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _Toaster toaster = _Toaster();

class _Toaster {
  void show({@required String message, @required Color color}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      textColor: Colors.black,
      backgroundColor: color,
      timeInSecForIos: 2,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
