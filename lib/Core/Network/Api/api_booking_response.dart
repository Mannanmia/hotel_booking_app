import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:hoel_booking_app/Model/booking_history_response.dart';
import 'package:hoel_booking_app/utils/shared_pref_utils.dart';
import 'package:hoel_booking_app/utils/toast_utils.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;

class ApiBookingHistory{
  Future<BookingHistoryResponse?> get_ApiBookingHistory(var context)async{

    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Searching History');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      var htl_id = await SharedPrefUtil.getInt("htl_id");
      final String urlData = "https://dev.htlbd.com/api/vendor/booking/hotel/$htl_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      var data = BookingHistoryResponse.fromJson(jsonData);
      pd.close();
      return data;
    }catch (e) {
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