import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Model/ApiResponseCarrer.dart';
import 'package:hoel_booking_app/screens/career_List_view.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../../utils/shared_pref_utils.dart';
import '../../../utils/toast_utils.dart';

class TotalCareerList{
  Future<List<CarrerResponse>?> get_ApiCarrierList(var context)async{
    List<CarrerResponse> careerList = [];
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Searching Carrer');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/career?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      var carrers = jsonData["rows"];
      for(int i =0 ;i<carrers.length;i++){
        CarrerResponse data = CarrerResponse(carrers[i]["id"], carrers[i]["title"],carrers[i]["image_id"], carrers[i]["deadline"]);
        careerList.add(data);
      }
      pd.close();
      return  careerList;

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



  void postApiAddCarrer(var context,String title,String content,String video,String featuredimage,String bannerImage,String bedNo,String bathroom, String size, String minday,String maxday,String price,String sellprice,String guest) async{

    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Career Data Uploading');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/career/0?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response= await http.post(url,body: {'title':title, 'content':content, 'price':price,'video':video, 'image_id':featuredimage
        ,'banner_image_id':bannerImage,'sale_price':sellprice
      });
      if(response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        String sms = jsonData["message"];
        ToastUtil.showShortToast(sms);
        pd.close();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CareerListView()));
      }

    }catch(e){
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
        pd.close();
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
        pd.close();
      } else {
        ToastUtil.showShortToast(e.toString());
        pd.close();
      }
    }
  }


  void postApiUpdateCarrer(var context,int id,String title,String content,String video,String featuredimage,String bannerImage,String bedNo,String bathroom, String size, String minday,String maxday,String price,String sellprice,String guest) async{

    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Career Data Uploading');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/career/$id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response= await http.post(url,body: {'title':title, 'content':content, 'price':price,'video':video, 'image_id':featuredimage
        ,'banner_image_id':bannerImage,'sale_price':sellprice
      });
      if(response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        String sms = jsonData["message"];
        ToastUtil.showShortToast(sms);
        pd.close();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CareerListView()));
      }

    }catch(e){
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
        pd.close();
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
        pd.close();
      } else {
        ToastUtil.showShortToast(e.toString());
        pd.close();
      }
    }
  }

  Future<int?> ApiDeletCarrer(int carrer_id)async{
    try{
      print(carrer_id);
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/career/delete/$carrer_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        ToastUtil.showShortToast("Carrer Deleted");
        return 1;
      }else{
        ToastUtil.showShortToast("Carrer Not Found");
      }
    }catch (e) {
      if (e is SocketException) {
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        ToastUtil.showShortToast("Request Time Out");
      } else {
        ToastUtil.showShortToast("Fill Up Form");
      }
    }
  }


}