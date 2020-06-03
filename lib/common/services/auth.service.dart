import 'dart:convert';

import 'package:manageYourMoneyMobile/common/constants/config.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


// Future getLotItems(isDevice, dosages, dosageId, lotItemsId, medId) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String token = prefs.getString('access_token');
//   String dispenserId = prefs.getString('dispenserId');
//   String code = prefs.getString('agencyCode');
//   final Map<String, dynamic> body = {
//     "IsDispenserMedication": isDevice,
//     "MethadoneMedicationId": medId,
//     "MethadoneMedicationDosageId": dosageId,
//     "MethadoneMedicationDosageIds": dosages,
//     "MethadoneMedicationLotItemIds": lotItemsId,
//     "MethadoneMedicationDispenserId": isDevice ? dispenserId : null,
//     "IsNotEmptyOnly": true
//   };
//   final response = await http.post('${getBaseApiURL(code)}/lotItems/filter',
//       headers: {'X-API-Token': token, 'Content-Type': 'application/json'},
//       body: json.encode(body));
//   if (response.statusCode == 200) {
//     return json
//         .decode(response.body)
//         .map<LotItemModel>((item) => LotItemModel.fromJson(item))
//         .toList();
//   } else if (response.statusCode == 401) {
//     refreshToken().then((data) {
//       if (data != null) {
//         store.dispatch(GetLotItemsListPending(
//             isDevice: isDevice,
//             dosages: dosages,
//             dosageIdOne: dosageId,
//             lotItemsId: lotItemsId));
//       }
//     });
//   } else {
//     throw Exception('Failed to getting lotItems ');
//   }
// }

Future signUp(String _login,String _email,String _password) async {
  print(_login);
  print(_email);
  print(_password);
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('access_token');
  // String dispenserId = prefs.getString('dispenserId');
  final Map<String,dynamic>body = {
    'login' :_login,
    'email': _email,
    'password': _password
  };
  print('${getBaseApiURL()}auth/sign-up');
  final http.Response response = await http.post('${getBaseApiURL()}auth/sign-up',
    // headers: {'X-API-Token': token, 'Content-Type': 'application/json'},
      body: json.encode(body));
  print(response.body);

}