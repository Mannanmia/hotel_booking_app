 import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/screens/LoginView.dart';
import '../../../utils/api_config.dart';
import 'package:http/http.dart' as http;
import '../../../utils/shared_pref_utils.dart';
import '../../../utils/toast_utils.dart';

class ApiLogout {
  Future<void>apiLogout(var context)async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = NetworkConstants.baseUrl + "auth/logout";
      var url = Uri.parse(urlData);
      var response = await http.post(url, body: {'token': access_token});
      var jsonData = jsonDecode(response.body);

      if(response.statusCode == 200){
         ToastUtil.showLongToast(jsonData["message"]);
         Navigator.pop(context);
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      }else if(response.statusCode == 401){
        ToastUtil.showShortToast(jsonData["message"]);
        Navigator.pop(context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
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