import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Model/ApiResponseTourList.dart';
import 'package:hoel_booking_app/Model/tour_availitylist.dart';
import 'package:hoel_booking_app/screens/tour_List_View.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../../utils/shared_pref_utils.dart';
import '../../../utils/toast_utils.dart';

class TotalTourList{
  Future<List<ToursResponse>?> get_ApiTourList(var context)async{
    List<ToursResponse> tourList = [];
    ProgressDialog pb = ProgressDialog(context: context);
    pb.show(max: 100, msg: "Fetching Data");
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/tours?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      var tours = jsonData["rows"];
      for(int i =0 ;i<tours.length;i++){
        ToursResponse data = ToursResponse(tours[i]["id"],tours[i]["title"],tours[i]["image_id"],tours[i]["price"],tours[i]["duration"],tours[i]["sdate"]);
        tourList.add(data);
      }
      pb.close();
      return  tourList;

    }catch (e) {
      if (e is SocketException) {
        pb.close();
        ToastUtil.showShortToast("Cheack Network Connection");
      } else if (e is TimeoutException) {
        pb.close();
        ToastUtil.showShortToast("Request Time Out");
      } else {
        pb.close();
        ToastUtil.showShortToast(e.toString());
      }
    }
  }

  void postApiAddTour(var context,String title , String short_description,String _banner_image,String feature_image
      ,String duration,String sdate , String tour_cost,String sell_cost,String content,String edate,String maxpeople,String minpeople,String address,String map_lat,String map_lng) async{
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Package Uploading');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = await "https://dev.htlbd.com/api/vendor/tour/0?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.post(url,body: {'title':title,'short_desc':short_description,'image_id':feature_image,
        'banner_image_id':_banner_image,'price':tour_cost, 'sale_price':sell_cost,'duration':duration,'sdate':sdate,
     'address':address,'map_lat':map_lat,'map_lng':map_lng,'map_zoom':"8",'min_people':minpeople,'max_people':maxpeople,
      'edate':edate});

      if(response.statusCode ==200){
        var jsonData = jsonDecode(response.body);
        String messege = jsonData["message"];
        pd.close();
        ToastUtil.showShortToast(messege);
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => TourListView()));
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


  void postApiUpdateTour(var context,int tour_id,String title , String short_description,String _banner_image,String feature_image
      ,String duration,String sdate , String tour_cost,String sell_cost) async{
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Package Uploading');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = await "https://dev.htlbd.com/api/vendor/tour/$tour_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.post(url,body: {'title':title,'short_desc':short_description,'image_id':feature_image,''
          'banner_image_id':_banner_image,'price':tour_cost, 'sale_price':sell_cost,'duration':duration,'sdate':sdate});

      if(response.statusCode ==200){
        var jsonData = jsonDecode(response.body);
        String messege = jsonData["message"];
        pd.close();
        ToastUtil.showShortToast(messege);
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => TourListView()));
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


  Future<int?> ApiDeletTour(int tour_id)async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/tour/delete/$tour_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        ToastUtil.showShortToast("Tour Deleted");
        return 1;
      }else{
        ToastUtil.showShortToast("Tour Not Found");
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

  Future<List<TourAvailibility>?> apiGetAvailabiliyList(int tour_id,String startDate,String endDate)async{
    try{
      List<TourAvailibility> eventLists =[];
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/dates/tour/$tour_id?id=$tour_id&start=$startDate&end=$endDate&token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        var jsonData = await jsonDecode(response.body);
        for(int i =0 ;i<30;i++){
          eventLists.add(TourAvailibility.fromJson(jsonData[i]));
        }
        return eventLists;
      }else{
        ToastUtil.showShortToast("Item Not Found");
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
