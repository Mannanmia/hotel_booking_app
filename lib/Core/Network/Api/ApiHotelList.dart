import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hoel_booking_app/Model/ApiResponseHotelList.dart';
import 'package:hoel_booking_app/screens/hotel_list_view.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../../utils/shared_pref_utils.dart';
import '../../../utils/toast_utils.dart';

class TotalHoteltList{
  Future<List<HotelResponse>?> get_ApiHotelList(var context)async{
    List<HotelResponse> hotelList = [];
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Searching Hotel');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/hotels?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      var hotels = jsonData["rows"];
      for(int i =0 ;i<hotels.length;i++){
        HotelResponse data = HotelResponse(hotels[i]["id"], hotels[i]["title"], hotels[i]["address"],hotels[i]["image_id"], hotels[i]["phone"]);
        hotelList.add(data);
      }
      pd.close();
      return  hotelList;

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



  void postApiAddHotel(var context,String htl_name,String rep_name,String rep_emale,String _website,String _mobileNum,String _idcard , String _tredLicence , String _address ,
      String content,String youtubelink,String htlImageid,String feturedimageid,String checkIn,String checkout,
      String mindaybefore,String mindayStay,String htlPrice,String htlsellPrice,String map_lat,String map_lng) async{
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Hotel Data Uploading');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/hotel/0?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.post(url, body: {'title': htl_name,'rep_name': rep_name,'rep_email':rep_emale,'rep_url': _website,'rep_mobile':_mobileNum,'rep_idc': _idcard,'rep_license': _tredLicence,'address': _address,'phone':_mobileNum,
      'content':content,'image_id':htlImageid,'banner_image_id':feturedimageid,'map_lat':map_lat,'map_lng':map_lng,'map_zoom':"8",
      'video':youtubelink,'price':htlPrice,"check_in_time":checkIn,'check_out_time':checkout,'sale_price':htlsellPrice,'min_day_before_booking':mindaybefore,
      'min_day_stays':mindayStay});
      var jsonData = jsonDecode(response.body);

      if(response.statusCode == 200){
        pd.close();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) =>const HotelListView()));
      }

    }catch (e) {
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




  void postApiUpdateHotel(var context,int hotel_id,String htl_name,String rep_name,String rep_emale,String _website,String _mobileNum,String _idcard , String _tredLicence , String _address ) async{
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Hotel Data Uploading');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/hotel/$hotel_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.post(url, body: {'title': htl_name,'rep_name': rep_name,'rep_email':rep_emale,'rep_url': _website,'rep_mobile':_mobileNum,'rep_idc': _idcard,'rep_license': _tredLicence,'address': _address,'phone':_mobileNum});
      var jsonData = jsonDecode(response.body);

      if(response.statusCode == 200){
        pd.close();
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HotelListView()));
      }

    }catch (e) {
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

}
