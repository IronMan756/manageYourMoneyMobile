import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manageYourMoneyMobile/common/services/toaster.service.dart';
import 'package:http/http.dart' as http;
import 'package:manageYourMoneyMobile/common/constants/config.dart';
import 'package:manageYourMoneyMobile/store/models/income.model.dart';

import 'package:shared_preferences/shared_preferences.dart';

Future<List<IncomeModel>> getIncomes() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('access_token');
    final http.Response response =
        await http.get('${getBaseApiURL()}incomes', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return json
          .decode(response.body)['data']
          .map<IncomeModel>((dynamic item) =>
              IncomeModel.fromJson(item as Map<String, dynamic>))
          .toList() as List<IncomeModel>;
    }
  } catch (e) {
    print(e);
    toaster.show(
        message: 'Error 404, Please try again later', color: Colors.red);
    return null;
  }
}
