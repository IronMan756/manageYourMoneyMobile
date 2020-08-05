import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/constants/config.dart';
import 'package:manageYourMoneyMobile/common/services/toaster.service.dart';
import 'package:manageYourMoneyMobile/store/models/expence.model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

// ignore: missing_return
Future<List<ExpenceModel>> getExpences() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token');
    final http.Response response =
        await http.get('${getBaseApiURL()}expences', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return json
          .decode(response.body)['data']
          .map<ExpenceModel>((dynamic item) =>
              ExpenceModel.fromJson(item as Map<String, dynamic>))
          .toList() as List<ExpenceModel>;
    }
  } catch (e) {
    print(e);
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
    return null;
  }
}

// ignore: missing_return
Future<ExpenceModel> removeExpence(dynamic action) async {
  print('Xuy');
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token');
    print(action);
    // final http.Response response =
    //     await http.delete('${getBaseApiURL()}expences?id=$id', headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer $token',
    // });
    // if (response.statusCode == 200) {
    //   print(response.body);
    //   // json
    //   //     .decode(response.body)['data']
    //   //     .map<ExpenceModel>((dynamic item) =>
    //   //         ExpenceModel.fromJson(item as Map<String, dynamic>))
    //   //     .toList() as List<ExpenceModel>;
    // }
  } catch (e) {
    print(e);
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
    return null;
  }
}
