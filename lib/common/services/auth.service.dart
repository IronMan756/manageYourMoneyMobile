import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/constants/config.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:manageYourMoneyMobile/common/services/toaster.service.dart';

Future<dynamic> signUp(String _login, String _email, String _password) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('access_token');
  // String dispenserId = prefs.getString('dispenserId');
  final Map<String, dynamic> body = {
    'login': _login,
    'email': _email,
    'password': _password
  };

  final http.Response response = await http.post(
      '${getBaseApiURL()}auth/sign-up',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body));
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return  json.decode(response.body);
  } else if (response.statusCode == 404) {
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
  } else {
    throw Exception('Failed to getting lotItems ');
  }
}

Future<dynamic> logIn(String _email, String _password) async {
  final Map<String, dynamic> body = {'email': _email, 'password': _password};
  final http.Response response = await http.post(
      '${getBaseApiURL()}auth/sign-in',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body));
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return json.decode(response.body);
  } else if (response.statusCode == 404) {
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
  } else {
    throw Exception('Failed to getting lotItems ');
  }
}
