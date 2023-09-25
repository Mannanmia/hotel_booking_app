
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:hoel_booking_app/Model/payouts_response.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import '../../../utils/shared_pref_utils.dart';
import '../../../utils/toast_utils.dart';

class ApiPayouts {
  Future<PayoutsResponse?> getPayouts(var context)async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/payout?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      PayoutsResponse res = PayoutsResponse.fromJson(jsonData);
      return res;
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

  Future<void> postPayouts(PayoutsResponse res) async {

  }
}