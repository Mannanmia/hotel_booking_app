

import 'package:hoel_booking_app/Model/profile_response.dart';

import '../../../utils/shared_pref_utils.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../../utils/toast_utils.dart';

class ApiProfileData{

  Future<GetProfileResponse?>getProfile() async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/auth/me?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      if(response.statusCode == 200) {
        GetProfileResponse res = GetProfileResponse.fromJson(jsonData);

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