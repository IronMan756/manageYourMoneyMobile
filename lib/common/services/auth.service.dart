import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/constants/config.dart';
import 'package:http/http.dart' as http;
import 'package:manageYourMoneyMobile/common/services/toaster.service.dart';
import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> signUp(SignUpPending action) async {
  try {
  

    //   String token = prefs.getString('access_token');
    // String dispenserId = prefs.getString('dispenserId');
    final Map<String, dynamic> body = {
      'login': action.login,
      'email': action.email,
      'password': action.password
    };

    final http.Response response = await http.post(
        '${getBaseApiURL()}auth/sign-up',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body));
        print('it is auth service');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 404) {
      toaster.show(
          message: 'Error 404, Please try again later', color: Colors.red);
    } else if (response.statusCode == 409) {
      toaster.show(
          message: 'User with this Email or Password already exist',
          color: Colors.red);
    } else {
      throw Exception('Failed to getting lotItems ');
    }
  } catch (e) {
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
    return null;
  }
}

Future<dynamic> logIn(LoginPending action) async {
    print('1345549878984565');
     print(action.email);
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> body = {
      'email': action.email,
      'password': action.password
    };
    final http.Response response = await http.post(
        '${getBaseApiURL()}auth/sign-in',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body));
    if (response.statusCode == 200) {
      final Map<String, dynamic> body =
          json.decode(response.body) as Map<String, dynamic>;


      print('Token${body['token'].toString()}');

      await prefs.setString('access_token', body['token'].toString());
      return json.decode(response.body);
    } else if (response.statusCode == 409) {
      toaster.show(message: 'Incorrect Email or Password', color: Colors.red);
    } else {
      throw Exception('Failed to getting lotItems ');
    }
  } catch (e) {
    print(e);
    toaster.show(
      
        message: 'Error 404, Please try again later', color: Colors.red);
    return null;
  }
}




//  to read token     
// SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.getString('access_token')