import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:manageYourMoneyMobile/common/constants/config.dart';
import 'package:http/http.dart' as http;
import 'package:manageYourMoneyMobile/common/services/toaster.service.dart';
import 'package:manageYourMoneyMobile/store/actions/auth.action.dart';
import 'package:manageYourMoneyMobile/store/models/user.model.dart';
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

Future<String> logIn(LoginPending action) async {
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

      await prefs.setString('access_token', body['token'].toString());
      return json.decode(response.body).toString();
    } else {
      throw Exception('Failed to getting lotItems ');
    }
  } catch (e) {
    toaster.show(
        message: 'Incorrect Email or Password', color: Colors.red);
    return null;
  }
}

//  to read token
// SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.getString('access_token')


// ignore: missing_return
Future< List<UserModel>> checkUser() async {
  try{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String token = prefs.getString('access_token');
        final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    final http.Response response = await http.get(
        '${getBaseApiURL()}user?email=${decodedToken['email']}&pass=${decodedToken['password']}',
        headers: {'Content-Type': 'application/json',});
        print(response.statusCode );
    if (response.statusCode == 200) {  
      return  [json.decode(response.body)['data']].map<UserModel>((dynamic item) =>
              UserModel.fromJson(item as Map<String, dynamic>))
          .toList() as List<UserModel>;
    }  else {
       toaster.show(message: 'Incorrect Email or Password', color: Colors.red);
      throw Exception('Incorrect Email or Password');
    }
        
  }catch(e){
    toaster.show(
        message: 'Incorrect Email or Password', color: Colors.red);
    return null;}
}