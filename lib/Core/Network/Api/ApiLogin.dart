import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hoel_booking_app/screens/PageNavigationView.dart';
import 'package:hoel_booking_app/utils/shared_pref_utils.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Model/LoginResponse.dart';
import 'package:hoel_booking_app/utils/api_config.dart';
import 'package:hoel_booking_app/utils/toast_utils.dart';
import 'package:http/http.dart' as http;

class ApiLogin {

  void Login(BuildContext context, var email, var password) async {
    ProgressDialog pd = ProgressDialog(context: context);
    try {
      pd.show(max: 100, msg: 'Loading......');
      final String urlData = NetworkConstants.baseUrl + "auth/login";
      var url = Uri.parse(urlData);

      var response = await http.post(url, body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        LoginResponse res = LoginResponse(
            jsonData["status"],
            jsonData["access_token"],
            jsonData["token_type"],
            jsonData["expires_in"]);
        if (res.status == 1) {
          pd.close();
          await SharedPrefUtil.writeString("access_token", res.access_token);
          await SharedPrefUtil.writeString("token_type", res.token_type);
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => DashBoardNavigationBar()));
          ToastUtil.showShortToast("Log In Successful");
        }
      } else if (response.statusCode == 401) {
        pd.close();
        var jsonData = jsonDecode(response.body);
        ToastUtil.showShortToast(jsonData["message"]);
      }
    } catch (e) {
      if (e is SocketException) {
        pd.close();
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        pd.close();
        ToastUtil.showShortToast("Request Time Out");
      } else {
        pd.close();
        ToastUtil.showShortToast(e.toString());
      }
    }
  }
}
