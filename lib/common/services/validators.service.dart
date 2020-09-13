import 'package:flutter/material.dart';

final _ValidatorsService validators = _ValidatorsService();

class _ValidatorsService {
  String validateSize(String value, int length, String errorText) {
    if (value.length < length) {
      return errorText;
    } else {
      return null;
    }
  }

  String validateBalance(String value, int length, String errorText) {

    if (value.length < length ) {
      return errorText;
    } 
     if (value is int) {
      return errorText;
    }
    else {
      return null;
    }
  }

  String validateIsEmpty(String value, String errorText) {
    if (value.isEmpty) {
      return errorText;
    } else {
      return null;
    }
  }

  String compareValidate(
      String value, TextEditingController controller, String errorText) {
    if (value != controller.text) {
      return errorText;
    } else {
      return null;
    }
  }

  String validateTiming(String value) {
    final RegExp regex = RegExp(
        r'((([1-9])|([1-2][0-3]))h\s(([0-5][0-9])|[0-9])m)|^((([1-9])|([1-2][0-3]))h)$|^(([0-5][0-9])|([1-9]))m$');
    if (!regex.hasMatch(value)) {
      return 'Enter valid time';
    } else {
      return null;
    }
  }


    String validateEmail(String value, String errorText) {
    final RegExp regex = RegExp(
  r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$'
        
        
        
        );
    if (!regex.hasMatch(value)) {
      return errorText;
    } else {
      return null;
    }
  }
}
