import 'package:hoel_booking_app/Model/check_verification.dart';
import 'package:http/http.dart' as http;
import '../../../utils/shared_pref_utils.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../../../utils/toast_utils.dart';

class CheckVerification {

  Future<VerificationResponse?>checkVarification()async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/user/verification?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);

      if(response.statusCode == 200) {
        VerificationResponse res = VerificationResponse(jsonData["fields"]["phone"]["data"], jsonData["fields"]["id_card"]["is_verified"],jsonData["fields"]["trade_license"]["is_verified"],jsonData["fields"]["phone"]["is_verified"]);
        return res;
      }
    }catch (e) {
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
      } else {
        ToastUtil.showShortToast(e.toString());
      }
    }
  }

}