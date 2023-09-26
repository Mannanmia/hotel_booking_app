import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hoel_booking_app/Model/dashboardResponse.dart';
import 'package:hoel_booking_app/utils/shared_pref_utils.dart';
import 'package:http/http.dart' as http;
import '../../../utils/toast_utils.dart';

class ApiDashboard{

  Future<DashboardResponse?> get_Apiresponse()async{
      try{
        var access_token = await SharedPrefUtil.getString("access_token");
        final String urlData = "https://dev.htlbd.com/api/vendor/dashboard?token="+"$access_token";
        var url = Uri.parse(urlData);
        var response = await http.get(url);
        var jsonData = jsonDecode(response.body);
        DashboardResponse data = DashboardResponse(jsonData["name"],jsonData["location"],jsonData["id"],jsonData["data"]["Pending"],jsonData["data"]["Earnings"],jsonData["data"]["Bookings"],jsonData["data"]["Services"],jsonData["data"]["date"],jsonData["data"]["Room"],jsonData["data"]["RoomT"],jsonData["data"]["Avail"],jsonData["data"]["AvailT"],jsonData["data"]["Request"],jsonData["data"]["RequestT"],jsonData["data"]["Review"],jsonData["data"]["ReviewT"],jsonData["data"]["What"],jsonData["data"]["WhatT"]);
        return data;
      }catch (e) {
        if (e is SocketException) {
          ToastUtil.showShortToast("Cheack Network Connection");
        } else if (e is TimeoutException) {
          ToastUtil.showShortToast("Request Time Out");
        } else {
          ToastUtil.showLongToast("Network Error Please Login Again");
        }
      }
  }
}