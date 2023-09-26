import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/screens/LoginView.dart';
import 'package:hoel_booking_app/utils/api_config.dart';
import 'package:hoel_booking_app/utils/shared_pref_utils.dart';
import 'package:hoel_booking_app/utils/toast_utils.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:http/http.dart' as http;

class ChangePassword{
  void changePasswordApi(BuildContext context, String oldPassword, String newPassword,String reNewPassword) async {
    ProgressDialog pd = ProgressDialog(context: context);
    try {
      pd.show(max: 100, msg: 'Loading......');
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = NetworkConstants.baseUrl + "auth/change-password?token="+"$access_token";
      var url = Uri.parse(urlData);

      var response = await http.post(url, body: {'current-password': oldPassword, 'new-password':newPassword,'new-password_confirmation':reNewPassword});
      if (response.statusCode == 200) {
        ToastUtil.showShortToast("Password Change Successfully");
          pd.close();
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);

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