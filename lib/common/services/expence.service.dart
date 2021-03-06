import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/constants/config.dart';
import 'package:manageYourMoneyMobile/common/services/toaster.service.dart';
import 'package:manageYourMoneyMobile/store/actions/expences.action.dart';
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
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
    return null;
  }
}

// ignore: missing_return
Future<dynamic> removeExpence(dynamic action) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token');

    final http.Response response = await http
        .delete('${getBaseApiURL()}expences?id=${action.id}', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'] as dynamic;
    }
  } catch (e) {
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
    return null;
  }
}


Future<dynamic> createExpence(CreateExpencePending payload) async {
  try {
   
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   final String token = prefs.getString('access_token');

   final Map<String, dynamic> body = {
        'userId': payload.userId,
        'purseId': payload.purseId,
        'suma': payload.suma,
        'data': payload.data,
        'name': payload.name,
        'description': payload.description
          };
    final http.Response response = await http
      .post('${getBaseApiURL()}expences', headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, 
      body: json.encode(body));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'] as dynamic;
    }
  } catch (e) {
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
    return null;
  }
}
