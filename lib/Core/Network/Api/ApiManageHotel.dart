import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:hoel_booking_app/Model/manageHotelResponse.dart';
import 'package:http/http.dart' as http;
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../../utils/shared_pref_utils.dart';
import '../../../utils/toast_utils.dart';

class ApiManageHotel{

  Future<ManageHotelResponse?> get_ApiHotel()async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      var htl_id = await SharedPrefUtil.getInt("htl_id");
      final String urlData = "https://dev.htlbd.com/api/vendor/hotel/$htl_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      ManageHotelResponse data = ManageHotelResponse(jsonData["title"],jsonData["rep_name"],jsonData["rep_email"],jsonData["rep_url"],jsonData["rep_mobile"],jsonData["rep_idc"],jsonData["rep_license"],jsonData["map_lat"],jsonData["map_lng"],jsonData["map_zoom"],jsonData["address"],jsonData["location_id"],jsonData["recovery"],jsonData["status"],jsonData["district"]);
      return data;
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

  void postApiUpdateHotel(var context,String htl_name,String rep_name,String rep_emale,String _website,String _mobileNum,String _idcard , String _tredLicence , String _address , String _district) async{
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Hotel Information Updating');
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      var htl_id = await SharedPrefUtil.getInt("htl_id");
      final String urlData = "https://dev.htlbd.com/api/vendor/hotel/$htl_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.post(url, body: {'title': htl_name,'rep_name': rep_name,'rep_email':rep_emale,'rep_url': _website,'rep_mobile':_mobileNum,'rep_idc': _idcard,'rep_license': _tredLicence,'address': _address});
      var jsonData = jsonDecode(response.body);

      if(response.statusCode == 200);
      ToastUtil.showShortToast("Saved Successfully");
      pd.close();

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


  Future<ManageHotelResponse?> get_ApiHotelById(int htl_id)async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/hotel/$htl_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      ManageHotelResponse data = ManageHotelResponse(jsonData["title"],jsonData["rep_name"],jsonData["rep_email"],jsonData["rep_url"],jsonData["rep_mobile"],jsonData["rep_idc"],jsonData["rep_license"],jsonData["map_lat"],jsonData["map_lng"],jsonData["map_zoom"],jsonData["address"],jsonData["location_id"],jsonData["recovery"],jsonData["status"],jsonData["district"]);
      return data;
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



  Future<int?> ApiDeletHotel(int htl_id)async{
    try{
      var access_token = await SharedPrefUtil.getString("access_token");
      final String urlData = "https://dev.htlbd.com/api/vendor/hotel/delete/$htl_id?token="+"$access_token";
      var url = Uri.parse(urlData);
      var response = await http.get(url);

      if(response.statusCode == 200) {
        ToastUtil.showShortToast("Hotel Deleted");
        return 1;
      }else{
        ToastUtil.showShortToast("Hotel Not Found");
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
